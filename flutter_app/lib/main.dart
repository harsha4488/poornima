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

/// ---------------------------------------------------------------------------
/// 100 INDIVIDUAL IMAGE PATHS
/// ---------------------------------------------------------------------------

const List<String> productImages = [
  'assets/products/001.jpg',
  'assets/products/002.jpg',
  'assets/products/003.jpg',
  'assets/products/004.jpg',
  'assets/products/005.jpg',
  'assets/products/006.jpg',
  'assets/products/007.jpg',
  'assets/products/008.jpg',
  'assets/products/009.jpg',
  'assets/products/010.jpg',
  'assets/products/011.jpg',
  'assets/products/012.jpg',
  'assets/products/013.jpg',
  'assets/products/014.jpg',
  'assets/products/015.jpg',
  'assets/products/016.jpg',
  'assets/products/017.jpg',
  'assets/products/018.jpg',
  'assets/products/019.jpg',
  'assets/products/020.jpg',
  'assets/products/021.jpg',
  'assets/products/022.jpg',
  'assets/products/023.jpg',
  'assets/products/024.jpg',
  'assets/products/025.jpg',
  'assets/products/026.jpg',
  'assets/products/027.jpg',
  'assets/products/028.jpg',
  'assets/products/029.jpg',
  'assets/products/030.jpg',
  'assets/products/031.jpg',
  'assets/products/032.jpg',
  'assets/products/033.jpg',
  'assets/products/034.jpg',
  'assets/products/035.jpg',
  'assets/products/036.jpg',
  'assets/products/037.jpg',
  'assets/products/038.jpg',
  'assets/products/039.jpg',
  'assets/products/040.jpg',
  'assets/products/041.jpg',
  'assets/products/042.jpg',
  'assets/products/043.jpg',
  'assets/products/044.jpg',
  'assets/products/045.jpg',
  'assets/products/046.jpg',
  'assets/products/047.jpg',
  'assets/products/048.jpg',
  'assets/products/049.jpg',
  'assets/products/050.jpg',
  'assets/products/051.jpg',
  'assets/products/052.jpg',
  'assets/products/053.jpg',
  'assets/products/054.jpg',
  'assets/products/055.jpg',
  'assets/products/056.jpg',
  'assets/products/057.jpg',
  'assets/products/058.jpg',
  'assets/products/059.jpg',
  'assets/products/060.jpg',
  'assets/products/061.jpg',
  'assets/products/062.jpg',
  'assets/products/063.jpg',
  'assets/products/064.jpg',
  'assets/products/065.jpg',
  'assets/products/066.jpg',
  'assets/products/067.jpg',
  'assets/products/068.jpg',
  'assets/products/069.jpg',
  'assets/products/070.jpg',
  'assets/products/071.jpg',
  'assets/products/072.jpg',
  'assets/products/073.jpg',
  'assets/products/074.jpg',
  'assets/products/075.jpg',
  'assets/products/076.jpg',
  'assets/products/077.jpg',
  'assets/products/078.jpg',
  'assets/products/079.jpg',
  'assets/products/080.jpg',
  'assets/products/081.jpg',
  'assets/products/082.jpg',
  'assets/products/083.jpg',
  'assets/products/084.jpg',
  'assets/products/085.jpg',
  'assets/products/086.jpg',
  'assets/products/087.jpg',
  'assets/products/088.jpg',
  'assets/products/089.jpg',
  'assets/products/090.jpg',
  'assets/products/091.jpg',
  'assets/products/092.jpg',
  'assets/products/093.jpg',
  'assets/products/094.jpg',
  'assets/products/095.jpg',
  'assets/products/096.jpg',
  'assets/products/097.jpg',
  'assets/products/098.jpg',
  'assets/products/099.jpg',
  'assets/products/100.jpg',
];

const List<String> goldProducts = [
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

const List<String> diamondProducts = [
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

const List<String> silverProducts = [
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

const List<String> bridalProducts = [
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

  int imageNumber = 1;

  // GOLD - 25 products
  for (int i = 0; i < 25; i++) {
    result.add(
      Product(
        name: goldProducts[i],
        category: 'Gold',
        code: 'PJ-G-${imageNumber.toString().padLeft(3, '0')}',
        weight: '${(8 + i * 1.3).toStringAsFixed(1)} g',
        purity: '22K',
        price: 55000 + (i * 7500),
        image: productImages[imageNumber - 1],
      ),
    );

    imageNumber++;
  }

  // DIAMOND - 20 products
  for (int i = 0; i < 20; i++) {
    final String suffix =
        i >= diamondProducts.length
            ? ' ${i - diamondProducts.length + 2}'
            : '';

    result.add(
      Product(
        name: '${diamondProducts[i % diamondProducts.length]}$suffix',
        category: 'Diamond',
        code: 'PJ-D-${imageNumber.toString().padLeft(3, '0')}',
        weight: '${(2.5 + i * 0.4).toStringAsFixed(1)} g',
        purity: '18K',
        price: 65000 + (i * 9000),
        image: productImages[imageNumber - 1],
      ),
    );

    imageNumber++;
  }

  // SILVER - 25 products
  for (int i = 0; i < 25; i++) {
    final String suffix =
        i >= silverProducts.length
            ? ' ${i - silverProducts.length + 2}'
            : '';

    result.add(
      Product(
        name: '${silverProducts[i % silverProducts.length]}$suffix',
        category: 'Silver',
        code: 'PJ-S-${imageNumber.toString().padLeft(3, '0')}',
        weight: '${(8 + i * 1.1).toStringAsFixed(1)} g',
        purity: '925',
        price: 2500 + (i * 650),
        image: productImages[imageNumber - 1],
      ),
    );

    imageNumber++;
  }

  // BRIDAL - 30 products
  for (int i = 0; i < 30; i++) {
    final String suffix =
        i >= bridalProducts.length
            ? ' ${i - bridalProducts.length + 2}'
            : '';

    result.add(
      Product(
        name: '${bridalProducts[i % bridalProducts.length]}$suffix',
        category: 'Bridal',
        code: 'PJ-B-${imageNumber.toString().padLeft(3, '0')}',
        weight: '${(15 + i * 1.5).toStringAsFixed(1)} g',
        purity: '22K',
        price: 110000 + (i * 8500),
        image: productImages[imageNumber - 1],
      ),
    );

    imageNumber++;
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

      final searchMatch =
          query.isEmpty ||
          product.name.toLowerCase().contains(query) ||
          product.code.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query);

      return categoryMatch && searchMatch;
    }).toList();
  }

  int columnsForWidth(double width) {
    if (width >= 1500) return 6;
    if (width >= 1200) return 5;
    if (width >= 900) return 4;
    if (width >= 650) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5EF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final columnCount =
                columnsForWidth(constraints.maxWidth);

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
                  child: _buildCount(),
                ),

                _buildGrid(columnCount),
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
      toolbarHeight: 60,
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
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            size: 21,
          ),
        ),
      ],
    );
  }

  Widget _buildHero() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        12,
        10,
        12,
        8,
      ),
      padding: const EdgeInsets.all(20),
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
          SizedBox(height: 7),
          Text(
            'Find something beautifully yours.',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B2419),
            ),
          ),
          SizedBox(height: 7),
          Text(
            '100 unique jewellery products to explore.',
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
      padding: const EdgeInsets.fromLTRB(
        12,
        5,
        12,
        4,
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        style: const TextStyle(
          fontSize: 13,
        ),
        decoration: InputDecoration(
          hintText:
              'Search jewellery or product code...',
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
                  icon: const Icon(
                    Icons.clear,
                    size: 18,
                  ),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(
            vertical: 9,
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(13),
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
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          final isSelected =
              selectedCategory == item;

          return Padding(
            padding: const EdgeInsets.only(
              right: 7,
            ),
            child: ChoiceChip(
              label: Text(
                item,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
              selected: isSelected,
              onSelected: (_) {
                setState(() {
                  selectedCategory = item;
                });
              },
              selectedColor:
                  const Color(0xFFC39A45),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.black87,
                fontWeight:
                    FontWeight.w600,
              ),
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }

  Widget _buildCount() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        14,
        5,
        14,
        8,
      ),
      child: Row(
        children: [
          Text(
            '${filteredProducts.length} products',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B2419),
            ),
          ),
          const Spacer(),
          Text(
            selectedCategory == 'All'
                ? 'All products'
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

  Widget _buildGrid(int columnCount) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        12,
        0,
        12,
        25,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product =
                filteredProducts[index];

            return ProductCard(
              product: product,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProductDetailsPage(
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
          crossAxisCount: columnCount,
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.05,
              ),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) {
                        return Container(
                          color: const Color(
                            0xFFF0EBE0,
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons
                                      .image_not_supported_outlined,
                                  size: 30,
                                  color:
                                      Color(
                                    0xFFC39A45,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Image unavailable',
                                  style:
                                      TextStyle(
                                    fontSize: 8,
                                    color:
                                        Colors
                                            .black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    left: 6,
                    top: 6,
                    child: _badge(
                      product.category,
                      dark: true,
                    ),
                  ),

                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration:
                          BoxDecoration(
                        color: Colors.white
                            .withValues(
                          alpha: 0.92,
                        ),
                        shape:
                            BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons
                            .favorite_border,
                        size: 15,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 6,
                    bottom: 6,
                    child: _badge(
                      product.code,
                      dark: false,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                  8,
                  6,
                  8,
                  6,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      style:
                          const TextStyle(
                        fontSize: 11,
                        height: 1.1,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${product.weight} · ${product.purity}',
                      style:
                          const TextStyle(
                        fontSize: 8,
                        color:
                            Colors.black54,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '₹${formatIndianPrice(product.price)}',
                      style:
                          const TextStyle(
                        fontSize: 12,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(0xFF97742C),
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

  Widget _badge(
    String text, {
    required bool dark,
  }) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: dark
            ? Colors.black.withValues(
                alpha: 0.55,
              )
            : Colors.white.withValues(
                alpha: 0.92,
              ),
        borderRadius:
            BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8,
          color: dark
              ? Colors.white
              : Colors.black87,
          fontWeight: dark
              ? FontWeight.normal
              : FontWeight.bold,
        ),
      ),
    );
  }
}

class ProductDetailsPage
    extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F5EF),
      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF8F5EF),
        surfaceTintColor:
            Colors.transparent,
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 420,
              width: double.infinity,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) {
                  return Container(
                    color: const Color(
                      0xFFF0EBE0,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons
                            .image_not_supported_outlined,
                        size: 60,
                        color:
                            Color(0xFFC39A45),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category
                        .toUpperCase(),
                    style:
                        const TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      color:
                          Color(0xFF97742C),
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 7,
                  ),

                  Text(
                    product.name,
                    style:
                        const TextStyle(
                      fontSize: 27,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Color(0xFF2B2419),
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    'Product Code: ${product.code}',
                    style:
                        const TextStyle(
                      fontSize: 12,
                      color:
                          Colors.black54,
                    ),
                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  Text(
                    '₹${formatIndianPrice(product.price)}',
                    style:
                        const TextStyle(
                      fontSize: 25,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Color(0xFF97742C),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      _detailBox(
                        'Weight',
                        product.weight,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _detailBox(
                        'Purity',
                        product.purity,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  const Text(
                    'Product Information',
                    style:
                        TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    '${product.name} from our '
                    '${product.category.toLowerCase()} '
                    'collection. This catalogue '
                    'entry has been prepared for '
                    'product enquiry and display.',
                    style:
                        const TextStyle(
                      fontSize: 13,
                      height: 1.55,
                      color:
                          Colors.black54,
                    ),
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  SizedBox(
                    width:
                        double.infinity,
                    child:
                        ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat,
                      ),
                      label: const Text(
                        'Enquire on WhatsApp',
                      ),
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(
                          0xFFC39A45,
                        ),
                        foregroundColor:
                            Colors.white,
                        padding:
                            const EdgeInsets
                                .symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width:
                        double.infinity,
                    child:
                        OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                      ),
                      label: const Text(
                        'Call Store',
                      ),
                      style:
                          OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          vertical: 15,
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

  Widget _detailBox(
    String title,
    String value,
  ) {
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(11),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(
                fontSize: 9,
                color:
                    Colors.black54,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value,
              style:
                  const TextStyle(
                fontSize: 12,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatIndianPrice(int amount) {
  final value = amount.toString();

  if (value.length <= 3) {
    return value;
  }

  final lastThree =
      value.substring(value.length - 3);

  final remaining =
      value.substring(0, value.length - 3);

  final groups = <String>[];

  for (
    int i = remaining.length;
    i > 0;
    i -= 2
  ) {
    final start =
        i - 2 < 0 ? 0 : i - 2;

    groups.insert(
      0,
      remaining.substring(
        start,
        i,
      ),
    );
  }

  return '${groups.join(',')},$lastThree';
}
