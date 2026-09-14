import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: cors });
  try {
    const supabase = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!);
    const auth = req.headers.get('Authorization');
    if (!auth) throw new Error('Missing authorization');
    const userClient = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, { global: { headers: { Authorization: auth } } });
    const { data: userData } = await userClient.auth.getUser();
    if (!userData.user) throw new Error('Not authenticated');

    const { order_id } = await req.json();
    const { data: order, error } = await supabase.from('orders').select('*, order_items(*)').eq('id', order_id).eq('user_id', userData.user.id).single();
    if (error || !order) throw new Error('Order not found');
    if (order.status !== 'pending_payment') throw new Error('Order is not payable');

    const keyId = Deno.env.get('RAZORPAY_KEY_ID')!;
    const keySecret = Deno.env.get('RAZORPAY_KEY_SECRET')!;
    const callbackUrl = Deno.env.get('RAZORPAY_CALLBACK_URL') ?? 'https://poornimajewellers.com/app/';
    const basic = btoa(`${keyId}:${keySecret}`);

    const payload = {
      amount: order.total_paise,
      currency: 'INR',
      accept_partial: false,
      reference_id: order.order_number,
      description: `Poornima Jewellers ${order.order_number}`,
      callback_url: callbackUrl,
      callback_method: 'get',
      customer: { name: userData.user.user_metadata?.display_name ?? 'Poornima Customer', email: userData.user.email },
      notes: { order_id: order.id },
    };

    const r = await fetch('https://api.razorpay.com/v1/payment_links', {
      method: 'POST',
      headers: { Authorization: `Basic ${basic}`, 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });
    const data = await r.json();
    if (!r.ok) throw new Error(data?.error?.description ?? 'Razorpay API error');

    await supabase.from('orders').update({ payment_link_id: data.id, payment_link_url: data.short_url }).eq('id', order.id);
    await supabase.from('payments').insert({ order_id: order.id, provider: 'razorpay', payment_link_id: data.id, amount_paise: order.total_paise, status: 'issued' });

    return new Response(JSON.stringify({ payment_url: data.short_url, payment_link_id: data.id }), { headers: { ...cors, 'Content-Type': 'application/json' } });
  } catch (e) {
    return new Response(JSON.stringify({ error: e instanceof Error ? e.message : String(e) }), { status: 400, headers: { ...cors, 'Content-Type': 'application/json' } });
  }
});
