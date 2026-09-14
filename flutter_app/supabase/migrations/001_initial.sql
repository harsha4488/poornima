create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  phone text,
  role text not null default 'customer' check (role in ('customer','admin')),
  created_at timestamptz not null default now()
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  name text not null,
  category text not null check (category in ('Gold','Diamond','Silver','Bridal')),
  type text not null,
  finish text,
  stone text,
  weight_grams numeric(10,2),
  purity text,
  price_paise bigint,
  featured boolean not null default false,
  is_active boolean not null default true,
  image_path text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.addresses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade default auth.uid(),
  full_name text not null,
  phone text not null,
  line1 text not null,
  line2 text,
  city text not null,
  state text not null,
  pincode text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.favorites (
  user_id uuid not null references auth.users(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, product_id)
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text not null unique default ('PJ-' || upper(substr(replace(gen_random_uuid()::text,'-',''),1,10))),
  user_id uuid not null references auth.users(id) on delete restrict,
  address_id uuid references public.addresses(id) on delete set null,
  status text not null default 'pending_payment' check (status in ('pending_payment','paid','confirmed','packed','shipped','delivered','cancelled')),
  subtotal_paise bigint not null,
  shipping_paise bigint not null default 0,
  total_paise bigint not null,
  payment_link_id text,
  payment_link_url text,
  created_at timestamptz not null default now()
);

create table if not exists public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  product_id uuid not null references public.products(id),
  product_code text not null,
  product_name text not null,
  quantity integer not null check (quantity > 0),
  unit_price_paise bigint not null,
  line_total_paise bigint not null
);

create table if not exists public.payments (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  provider text not null default 'razorpay',
  payment_link_id text,
  payment_id text,
  status text not null default 'created',
  amount_paise bigint not null,
  raw_payload jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists products_category_idx on public.products(category);
create index if not exists orders_user_idx on public.orders(user_id, created_at desc);
create index if not exists addresses_user_idx on public.addresses(user_id, created_at desc);

alter table public.profiles enable row level security;
alter table public.products enable row level security;
alter table public.addresses enable row level security;
alter table public.favorites enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
alter table public.payments enable row level security;

drop policy if exists products_public_read on public.products;
create policy products_public_read on public.products for select using (is_active = true);

create policy addresses_own on public.addresses for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy favorites_own on public.favorites for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy orders_own on public.orders for select using (auth.uid() = user_id);
create policy order_items_own on public.order_items for select using (exists(select 1 from public.orders o where o.id = order_id and o.user_id = auth.uid()));
create policy payments_own on public.payments for select using (exists(select 1 from public.orders o where o.id = order_id and o.user_id = auth.uid()));
create policy profiles_own on public.profiles for select using (auth.uid() = id);
create policy profiles_own_update on public.profiles for update using (auth.uid() = id) with check (auth.uid() = id);

create or replace function public.handle_new_user() returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles(id, display_name) values(new.id, new.raw_user_meta_data->>'display_name');
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created after insert on auth.users for each row execute function public.handle_new_user();

create or replace function public.create_order(p_address_id uuid, p_items jsonb) returns uuid
language plpgsql security definer set search_path = public
as $$
declare
  v_order_id uuid;
  v_user uuid := auth.uid();
  v_subtotal bigint := 0;
  item jsonb;
  v_product public.products;
  v_qty int;
begin
  if v_user is null then raise exception 'Not authenticated'; end if;
  if jsonb_array_length(p_items) = 0 then raise exception 'Cart is empty'; end if;
  if not exists(select 1 from public.addresses where id=p_address_id and user_id=v_user) then raise exception 'Address does not belong to user'; end if;

  insert into public.orders(user_id,address_id,subtotal_paise,total_paise) values(v_user,p_address_id,0,0) returning id into v_order_id;
  for item in select * from jsonb_array_elements(p_items) loop
    select * into v_product from public.products where id=(item->>'product_id')::uuid and is_active=true;
    if not found then raise exception 'Product unavailable'; end if;
    v_qty := greatest(1,(item->>'quantity')::int);
    if v_product.price_paise is null then raise exception 'Product % has no configured price', v_product.code; end if;
    insert into public.order_items(order_id,product_id,product_code,product_name,quantity,unit_price_paise,line_total_paise)
      values(v_order_id,v_product.id,v_product.code,v_product.name,v_qty,v_product.price_paise,v_product.price_paise*v_qty);
    v_subtotal := v_subtotal + v_product.price_paise*v_qty;
  end loop;
  update public.orders set subtotal_paise=v_subtotal,total_paise=v_subtotal where id=v_order_id;
  return v_order_id;
end;
$$;

grant execute on function public.create_order(uuid,jsonb) to authenticated;


create or replace function public.is_admin() returns boolean
language sql stable security definer set search_path = public
as $$ select exists(select 1 from public.profiles where id = auth.uid() and role = 'admin'); $$;

grant execute on function public.is_admin() to authenticated;

create policy orders_admin_read on public.orders for select using (public.is_admin());
create policy orders_admin_update on public.orders for update using (public.is_admin()) with check (public.is_admin());
create policy order_items_admin_read on public.order_items for select using (public.is_admin());
create policy payments_admin_read on public.payments for select using (public.is_admin());
create policy products_admin_update on public.products for update using (public.is_admin()) with check (public.is_admin());
create policy products_admin_insert on public.products for insert with check (public.is_admin());

-- After the first customer signs up, promote the showroom account with:
-- update public.profiles set role='admin' where id='USER_UUID';
