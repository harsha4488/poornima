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

const productImages = [
  'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1617038220319-276d3cfab638?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1611652022419-a9419f74343d?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1598560917807-1bae44bdcbe7?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?auto=format&fit=crop&w=900&q=90',
  'https://images.unsplash.com/photo-1627293509201-cd5c0bd8f2b5?auto=format&fit=crop&w=900&q=90',
];

const goldNames = [
  'Classic Gold Necklace',
  'Royal Gold Necklace',
  'Temple Gold Necklace',
  'Antique Gold Necklace',
  'Lakshmi Gold Necklace',
  'Floral Gold Necklace',
  'Traditional Gold Necklace',
  'Designer Gold Necklace',
  'Elegant Gold Necklace',
  'Bridal Gold Necklace',
  'Classic Gold Chain',
  'Designer Gold Chain',
  'Rope Gold Chain',
  'Antique Gold Chain',
  'Lightweight Gold Chain',
  'Traditional Gold Bangle',
  'Designer Gold Bangle',
  'Antique Gold Bangle',
  'Classic Gold Bangle',
  'Wedding Gold Bangle',
  'Gold Stud Earrings',
  'Traditional Gold Earrings',
  'Gold Jhumka',
  'Designer Gold Jhumka',
  'Gold Hoop Earrings',
];

const diamondNames = [
  'Diamond Solitaire Ring',
  'Classic Diamond Ring',
  'Princess Diamond Ring',
  'Elegant Diamond Ring',
  'Diamond Wedding Ring',
  'Diamond Halo Ring',
  'Diamond Pendant',
  'Diamond Pendant Set',
  'Diamond Stud Earrings',
  'Diamond Drop Earrings',
  'Diamond Hoop Earrings',
  'Diamond Bracelet',
  'Diamond Tennis Bracelet',
  'Diamond Necklace',
  'Diamond Necklace Set',
];

const silverNames = [
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
  'Silver Bangle',
  'Silver Kada',
  'Silver Jewellery Set',
  'Silver Charm Bracelet',
  'Silver Pendant Set',
];

const bridalNames = [
  'Bridal Gold Necklace',
  'Bridal Necklace Set',
  'Bridal Jhumka',
  'Bridal Earrings',
  'Bridal Bangle Set',
  'Bridal Gold Set',
  'Temple Bridal Set',
  'Antique Bridal Set',
  'Royal Bridal Necklace',
  'Bridal Pendant Set',
  'Wedding Necklace',
  'Wedding Jewellery Set',
  'Bridal Choker',
  'Bridal Long Necklace',
  'Bridal Earrings Set',
];

List<Product> generateProducts() {
  final List<Product> result = [];

  int number = 1;

  // 25 Gold
  for (int i = 0; i < goldNames.length; i++) {
    result.add(
      Product(
        name: goldNames[i],
        category: 'Gold',
        code: 'PJ-G-${number.toString().padLeft(3, '0')}',
        weight: '${(8 + (i * 1.35)).toStringAsFixed(1)} g',
        purity: '22K',
        price: 55000 + (i * 7500),
        image: productImages[i % productImages.length],
      ),
    );
    number++;
  }

  // 20 Diamond
  for (int i = 0; i < 20; i++) {
    final name = diamondNames[i % diamondNames.length];

    result.add(
      Product(
        name: '$name${i >= diamondNames.length ? ' ${i ~/ diamondNames.length + 1}' : ''}',
        category: 'Diamond',
        code: 'PJ-D-${number.toString().padLeft(3, '0')}',
        weight: '${(2.5 + (i * 0.42)).toStringAsFixed(1)} g',
        purity: '18K',
        price: 65000 + (i * 9500),
        image: productImages[(i + 2) % productImages.length],
      ),
    );
    number++;
  }

  // 25 Silver
  for (int i = 0; i < 25; i++) {
    final name = silverNames[i % silverNames.length];

    result.add(
      Product(
        name: '$name${i >= silverNames.length ? ' ${i ~/ silverNames.length + 1}' : ''}',
        category: 'Silver',
        code: 'PJ-S-${number.toString().padLeft(3, '0')}',
        weight: '${(8 + (i * 1.2)).toStringAsFixed(1)} g',
        purity: '925',
        price: 2500 + (i * 650),
        image: productImages[(i + 4) % productImages.length],
      ),
    );
    number++;
  }

  // 30 Bridal
  for (int i = 0; i < 30; i++) {
    final name = bridalNames[i % bridalNames.length];

    result.add(
      Product(
        name: '$name${i >= bridalNames.length ? ' ${i ~/ bridalNames.length + 1}' : ''}',
        category: 'Bridal',
        code: 'PJ-B-${number.toString().padLeft(3, '0')}',
        weight: '${(15 + (i * 1.6)).toStringAsFixed(1)} g',
        purity: '22K',
        price: 110000 + (i * 8500),
        image: productImages[(i + 6) % productImages.length],
      ),
    );
    number++;
  }

  return result;
}

final List<Product> products = generateProducts();

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  String selectedCategory = 'All';
  String searchText = '';

  final List<String> categories = const [
    'All',
    'Gold',
    'Diamond',
    'Silver',
    'Bridal',
  ];

  List<Product> get filteredProducts {
    final query = searchText.trim().toLowerCase();

    return products.where((product) {
      final categoryMatch =
          selectedCategory == 'All' ||
          product.category == selectedCategory;

      if (query.isEmpty) {
        return categoryMatch;
      }

      final searchMatch =
          product.name.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query) ||
          product.code.toLowerCase().contains(query);

      return categoryMatch && searchMatch;
    }).toList();
  }

  int columnsForWidth(double width) {
    if (width >= 1400) return 6;
    if (width >= 1100) return 5;
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
            final columns = columnsForWidth(constraints.maxWidth);

            return CustomScrollView(
              slivers: [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: _buildHero(),
                ),
                SliverToBoxAdapter(
                  child: _buildSearch(),
                ),
                SliverToBoxAdapter(
                  child: _buildCategories(),
                ),
                SliverToBoxAdapter(
                  child: _buildProductCounter(),
                ),
                _buildProductGrid(columns),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 64,
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 20),
            selectedIcon: Icon(Icons.home, size: 20),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.diamond_outlined, size: 20),
            selectedIcon: Icon(Icons.diamond, size: 20),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border, size: 20),
            selectedIcon: Icon(Icons.favorite, size: 20),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, size: 20),
            selectedIcon: Icon(Icons.person, size: 20),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: const Color(0xFFF8F5EF),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 58,
      titleSpacing: 14,
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
              fontSize: 9,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Wishlist',
          onPressed: () {},
          icon: const Icon(Icons.favorite_border, size: 21),
        ),
      ],
    );
  }

  Widget _buildHero() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 7),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
              fontSize: 9,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Color(0xFF826523),
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Find something beautifully yours.',
            style: TextStyle(
              fontSize: 24,
              height: 1.08,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B2419),
            ),
          ),
          SizedBox(height: 7),
          Text(
            '100 jewellery products to explore.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 4),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: 'Search jewellery, category or product code...',
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
          ),
          suffixIcon: searchText.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searchText = '';
                    });
                  },
                  icon: const Icon(Icons.clear, size: 18),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 7),
            child: ChoiceChip(
              label: Text(
                category,
                style: const TextStyle(fontSize: 11),
              ),
              selected: selected,
              onSelected: (_) {
                setState(() {
                  selectedCategory = category;
                });
              },
              selectedColor: const Color(0xFFC39A45),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 1,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCounter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 7),
      child: Row(
        children: [
          Text(
            '${filteredProducts.length} products',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2B2419),
            ),
          ),
          const Spacer(),
          Text(
            selectedCategory == 'All'
                ? 'Showing all'
                : selectedCategory,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(int columns) {
    final items = filteredProducts;

    if (items.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.search_off,
                  size: 45,
                  color: Colors.black38,
                ),
                const SizedBox(height: 12),
                const Text(
                  'No products found',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Try another search or category.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 25),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = items[index];

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
          childCount: items.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,
          childAspectRatio: 0.70,
        ),
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
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.045),
              blurRadius: 5,
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
                      loadingBuilder:
                          (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: const Color(0xFFF1ECE2),
                          child: const Center(
                            child: Icon(
                              Icons.diamond_outlined,
                              size: 32,
                              color: Color(0xFFC39A45),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.58),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        product.category,
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.92),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    bottom: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        product.code,
                        style: const TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${product.weight} · ${product.purity}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 8,
                        color: Colors.black54,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '₹${_formatIndianPrice(product.price)}',
                      style: const TextStyle(
                        fontSize: 12,
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
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.05,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: const Color(0xFFF1ECE2),
                    child: const Center(
                      child: Icon(
                        Icons.diamond_outlined,
                        size: 60,
                        color: Color(0xFFC39A45),
                      ),
                    ),
                  );
                },
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
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2419),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Product Code: ${product.code}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '₹${_formatIndianPrice(product.price)}',
                    style: const TextStyle(
                      fontSize: 25,
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
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'About this product',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${product.name} is part of the Poornima Jewellers '
                    '${product.category.toLowerCase()} collection. '
                    'Weight: ${product.weight}. Purity: ${product.purity}.',
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat, size: 18),
                      label: const Text('Enquire on WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC39A45),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatIndianPrice(int amount) {
  final value = amount.toString();

  if (value.length <= 3) {
    return value;
  }

  final lastThree = value.substring(value.length - 3);
  final remaining = value.substring(0, value.length - 3);

  final buffer = StringBuffer();
  int count = 0;

  for (int i = remaining.length - 1; i >= 0; i--) {
    buffer.write(remaining[i]);
    count++;

    if (count == 2 && i != 0) {
      buffer.write(',');
      count = 0;
    }
  }

  final formattedRemaining = buffer.toString().split('').reversed.join();

  return '$formattedRemaining,$lastThree';
}