import 'package:flutter/material.dart';

void main() {
  runApp(const PoornimaJewellersApp());
}

class PoornimaJewellersApp extends StatelessWidget {
  const PoornimaJewellersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poornima Jewellers',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F5EF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC39A45),
        ),
        fontFamily: 'Arial',
      ),
      home: const ProductHomePage(),
    );
  }
}

class Product {
  final String name;
  final String category;
  final String code;
  final String weight;
  final String purity;
  final int price;
  final String image;

  const Product({
    required this.name,
    required this.category,
    required this.code,
    required this.weight,
    required this.purity,
    required this.price,
    required this.image,
  });
}

const imageUrls = [
  'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?auto=format&fit=crop&w=700&q=85',
  'https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=700&q=85',
  'https://images.unsplash.com/photo-1617038220319-276d3cfab638?auto=format&fit=crop&w=700&q=85',
  'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?auto=format&fit=crop&w=700&q=85',
  'https://images.unsplash.com/photo-1611652022419-a9419f74343d?auto=format&fit=crop&w=700&q=85',
  'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?auto=format&fit=crop&w=700&q=85',
];

const productNames = [
  'Classic Gold Necklace',
  'Royal Gold Necklace',
  'Temple Gold Necklace',
  'Antique Gold Necklace',
  'Lakshmi Gold Necklace',
  'Bridal Gold Necklace',
  'Diamond Solitaire Ring',
  'Classic Diamond Ring',
  'Princess Diamond Ring',
  'Elegant Diamond Ring',
  'Gold Stud Earrings',
  'Diamond Stud Earrings',
  'Traditional Jhumka',
  'Bridal Jhumka',
  'Gold Hoop Earrings',
  'Designer Gold Bangles',
  'Traditional Gold Bangles',
  'Antique Gold Bangle',
  'Daily Wear Bangle',
  'Bridal Bangles',
  'Classic Gold Chain',
  'Rope Gold Chain',
  'Designer Gold Chain',
  'Antique Gold Chain',
  'Lightweight Gold Chain',
  'Bridal Necklace Set',
  'Temple Jewellery Set',
  'Diamond Jewellery Set',
  'Gold Pendant Set',
  'Elegant Pendant',
  'Floral Gold Pendant',
  'Lakshmi Pendant',
  'Peacock Pendant',
  'Heart Pendant',
  'Gold Finger Ring',
  'Designer Finger Ring',
  'Wedding Ring',
  'Classic Gold Ring',
  'Antique Gold Ring',
  'Kids Gold Ring',
  'Silver Bracelet',
  'Designer Silver Bracelet',
  'Classic Silver Bracelet',
  'Silver Chain',
  'Silver Anklet',
  'Traditional Silver Anklet',
  'Silver Toe Ring',
  'Silver Pendant',
  'Silver Earrings',
  'Silver Ring',
];

List<Product> generateProducts() {
  final List<Product> result = [];

  for (int i = 0; i < 100; i++) {
    final name = productNames[i % productNames.length];
    final category = _categoryForIndex(i);
    final image = imageUrls[i % imageUrls.length];

    result.add(
      Product(
        name: '$name ${i + 1}',
        category: category,
        code: 'PJ-${_code(category)}-${(i + 1).toString().padLeft(3, '0')}',
        weight: '${(5 + (i * 1.7) % 35).toStringAsFixed(1)} g',
        purity: category == 'Silver'
            ? '925'
            : category == 'Diamond'
                ? '18K'
                : '22K',
        price: _priceForIndex(i, category),
        image: image,
      ),
    );
  }

  return result;
}

String _categoryForIndex(int index) {
  if (index % 10 < 5) return 'Gold';
  if (index % 10 < 7) return 'Diamond';
  if (index % 10 < 9) return 'Silver';
  return 'Bridal';
}

String _code(String category) {
  switch (category) {
    case 'Gold':
      return 'G';
    case 'Diamond':
      return 'D';
    case 'Silver':
      return 'S';
    case 'Bridal':
      return 'B';
    default:
      return 'J';
  }
}

int _priceForIndex(int index, String category) {
  if (category == 'Silver') {
    return 2500 + (index * 850);
  }

  if (category == 'Diamond') {
    return 65000 + (index * 4200);
  }

  if (category == 'Bridal') {
    return 110000 + (index * 7500);
  }

  return 55000 + (index * 6200);
}

final products = generateProducts();

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  String selectedCategory = 'All';
  String searchText = '';

  final categories = const [
    'All',
    'Gold',
    'Diamond',
    'Silver',
    'Bridal',
  ];

  List<Product> get filteredProducts {
    return products.where((product) {
      final categoryMatch = selectedCategory == 'All' ||
          product.category == selectedCategory;

      final text = searchText.toLowerCase();

      final searchMatch = product.name.toLowerCase().contains(text) ||
          product.category.toLowerCase().contains(text) ||
          product.code.toLowerCase().contains(text);

      return categoryMatch && searchMatch;
    }).toList();
  }

  int _columnsForWidth(double width) {
    if (width >= 1200) return 5;
    if (width >= 800) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final columns = _columnsForWidth(constraints.maxWidth);

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: const Color(0xFFF8F5EF),
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Poornima Jewellers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2B2419),
                        ),
                      ),
                      Text(
                        'Elegance · Trust · Tradition',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: _buildTopBanner(),
                ),

                SliverToBoxAdapter(
                  child: _buildSearch(),
                ),

                SliverToBoxAdapter(
                  child: _buildCategories(),
                ),

                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 30),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = filteredProducts[index];

                        return ProductCard(
                          product: product,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetailsPage(
                                  product: product,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      childCount: filteredProducts.length,
                    ),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.69,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.diamond_outlined),
            selectedIcon: Icon(Icons.diamond),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildTopBanner() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEAD9AE),
            Color(0xFFF8F5EF),
          ],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OUR COLLECTION',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Color(0xFF826523),
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Find something\nbeautifully yours.',
            style: TextStyle(
              fontSize: 25,
              height: 1.08,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B2419),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '100 jewellery designs to explore.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 7, 12, 5),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: const TextStyle(fontSize: 13),
          prefixIcon: const Icon(Icons.search, size: 21),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 52,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 7),
            child: ChoiceChip(
              label: Text(
                category,
                style: const TextStyle(fontSize: 12),
              ),
              selected: selected,
              onSelected: (_) {
                setState(() {
                  selectedCategory = category;
                });
              },
              selectedColor: const Color(0xFFC39A45),
              labelStyle: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    left: 7,
                    top: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        product.category,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 7,
                    top: 7,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(9, 7, 9, 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      '${product.weight} · ${product.purity}',
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.black54,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      '₹${product.price}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF97742C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5EF),
        surfaceTintColor: Colors.transparent,
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF97742C),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2419),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    product.code,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    '₹${product.price}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF97742C),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      _detailBox('Weight', product.weight),
                      const SizedBox(width: 8),
                      _detailBox('Purity', product.purity),
                      const SizedBox(width: 8),
                      _detailBox('Code', product.code),
                    ],
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat, size: 19),
                      label: const Text('Enquire on WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC39A45),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 9),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.call, size: 18),
                      label: const Text('Call Store'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailBox(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
