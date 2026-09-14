import 'package:supabase_flutter/supabase_flutter.dart';
import 'models.dart';

class ShopRepository {
  final SupabaseClient client;
  ShopRepository(this.client);

  Future<List<Product>> products({String? category, String? search}) async {
    var q = client.from('products').select().eq('is_active', true);
    if (category != null && category != 'All') q = q.eq('category', category);
    if (search != null && search.trim().isNotEmpty) {
      final s = search.trim();
      q = q.or('name.ilike.%$s%,code.ilike.%$s%,type.ilike.%$s%,stone.ilike.%$s%');
    }
    final rows = await q.order('featured', ascending: false).order('created_at', ascending: false);
    return (rows as List).map((e) => Product.fromMap(Map<String, dynamic>.from(e))).toList();
  }

  Future<Product?> productByCode(String code) async {
    final row = await client.from('products').select().eq('code', code).maybeSingle();
    return row == null ? null : Product.fromMap(row);
  }

  Future<Set<String>> favoriteCodes() async {
    final uid = client.auth.currentUser?.id;
    if (uid == null) return {};
    final rows = await client.from('favorites').select('product_id').eq('user_id', uid);
    return (rows as List).map((e) => e['product_id'] as String).toSet();
  }

  Future<void> setFavorite(String productId, bool value) async {
    if (value) {
      await client.from('favorites').upsert({'product_id': productId, 'user_id': client.auth.currentUser!.id});
    } else {
      await client.from('favorites').delete().eq('user_id', client.auth.currentUser!.id).eq('product_id', productId);
    }
  }

  Future<List<Address>> addresses() async {
    final rows = await client.from('addresses').select().order('created_at', ascending: false);
    return (rows as List).map((e) => Address.fromMap(Map<String, dynamic>.from(e))).toList();
  }

  Future<Address> addAddress(Address a) async {
    final row = await client.from('addresses').insert(a.toInsert()).select().single();
    return Address.fromMap(row);
  }

  Future<String> createOrder({required List<CartLine> lines, required Address address}) async {
    if (lines.isEmpty) throw Exception('Your cart is empty.');
    final result = await client.rpc('create_order', params: {
      'p_address_id': address.id,
      'p_items': lines.map((l) => {'product_id': l.product.id, 'quantity': l.quantity}).toList(),
    });
    return result as String;
  }

  Future<OrderSummary> getOrder(String orderId) async {
    final row = await client.from('orders').select().eq('id', orderId).single();
    return OrderSummary.fromMap(row);
  }

  Future<bool> isAdmin() async {
    final value = await client.rpc('is_admin');
    return value == true;
  }

  Future<List<OrderSummary>> myOrders({bool admin = false}) async {
    final rows = await client.from('orders').select().order('created_at', ascending: false);
    return (rows as List).map((e) => OrderSummary.fromMap(Map<String, dynamic>.from(e))).toList();
  }

  Future<String?> createPaymentLink(String orderId) async {
    final res = await client.functions.invoke('create-payment-link', body: {'order_id': orderId});
    final data = Map<String, dynamic>.from(res.data as Map);
    return data['payment_url'] as String?;
  }
}


  Future<void> updateOrderStatus(String orderId, String status) async {
    await client.from('orders').update({'status': status}).eq('id', orderId);
  }

  Future<void> updateProductPrice(String productId, int paise) async {
    await client.from('products').update({'price_paise': paise}).eq('id', productId);
  }
