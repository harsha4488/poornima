class Product {
  final String id;
  final String code;
  final String name;
  final String category;
  final String type;
  final String finish;
  final String stone;
  final double weight;
  final String purity;
  final int? pricePaise;
  final bool featured;
  final bool isActive;
  final String imagePath;

  const Product({
    required this.id,
    required this.code,
    required this.name,
    required this.category,
    required this.type,
    required this.finish,
    required this.stone,
    required this.weight,
    required this.purity,
    required this.pricePaise,
    required this.featured,
    required this.isActive,
    required this.imagePath,
  });

  factory Product.fromMap(Map<String, dynamic> m) => Product(
        id: m['id'] as String,
        code: m['code'] as String,
        name: m['name'] as String,
        category: m['category'] as String,
        type: (m['type'] ?? '') as String,
        finish: (m['finish'] ?? '') as String,
        stone: (m['stone'] ?? '') as String,
        weight: ((m['weight_grams'] ?? 0) as num).toDouble(),
        purity: (m['purity'] ?? '') as String,
        pricePaise: m['price_paise'] as int?,
        featured: (m['featured'] ?? false) as bool,
        isActive: (m['is_active'] ?? true) as bool,
        imagePath: (m['image_path'] ?? '') as String,
      );
}

class Address {
  final String id;
  final String fullName;
  final String phone;
  final String line1;
  final String line2;
  final String city;
  final String state;
  final String pincode;

  const Address({required this.id, required this.fullName, required this.phone, required this.line1, required this.line2, required this.city, required this.state, required this.pincode});

  Map<String, dynamic> toInsert() => {
        'full_name': fullName,
        'phone': phone,
        'line1': line1,
        'line2': line2,
        'city': city,
        'state': state,
        'pincode': pincode,
      };

  factory Address.fromMap(Map<String, dynamic> m) => Address(
        id: m['id'] as String,
        fullName: m['full_name'] as String,
        phone: m['phone'] as String,
        line1: m['line1'] as String,
        line2: (m['line2'] ?? '') as String,
        city: m['city'] as String,
        state: m['state'] as String,
        pincode: m['pincode'] as String,
      );
}

class CartLine {
  final Product product;
  final int quantity;
  const CartLine(this.product, this.quantity);
  int get subtotalPaise => (product.pricePaise ?? 0) * quantity;
}

class OrderSummary {
  final String id;
  final String orderNumber;
  final String status;
  final int subtotalPaise;
  final int shippingPaise;
  final int totalPaise;
  final String? paymentLinkUrl;
  final DateTime createdAt;

  const OrderSummary({required this.id, required this.orderNumber, required this.status, required this.subtotalPaise, required this.shippingPaise, required this.totalPaise, required this.paymentLinkUrl, required this.createdAt});

  factory OrderSummary.fromMap(Map<String, dynamic> m) => OrderSummary(
        id: m['id'] as String,
        orderNumber: m['order_number'] as String,
        status: m['status'] as String,
        subtotalPaise: (m['subtotal_paise'] as num).toInt(),
        shippingPaise: (m['shipping_paise'] as num).toInt(),
        totalPaise: (m['total_paise'] as num).toInt(),
        paymentLinkUrl: m['payment_link_url'] as String?,
        createdAt: DateTime.parse(m['created_at'] as String),
      );
}
