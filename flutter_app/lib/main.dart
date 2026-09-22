import 'dart:async';
import 'package:flutter/material.dart';

const gold = Color(0xFFD9A94E);
const goldBright = Color(0xFFF3D48A);
const espresso = Color(0xFF130B08);
const panel = Color(0xFF21130D);
const panel2 = Color(0xFF2A1911);
const ivory = Color(0xFFF7F0E5);

void main() => runApp(const PoornimaApp());

class PoornimaApp extends StatelessWidget {
  const PoornimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poornima Jewellers',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: espresso,
        colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.dark),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String image;
  final String name;
  final String category;
  final String price;
  const Product(this.image, this.name, this.category, this.price);
}

const products = <Product>[
  Product('001.jpg', 'Emerald Heritage Necklace', 'Gold', '₹4,85,000'),
  Product('002.jpg', 'Diamond Halo Ring', 'Diamond', '₹1,28,900'),
  Product('003.jpg', 'Temple Jhumka Pair', 'Gold', '₹84,500'),
  Product('004.jpg', 'Ruby Bridal Necklace', 'Bridal', '₹6,42,000'),
  Product('005.jpg', 'Emerald Pendant Set', 'Gold', '₹1,12,500'),
  Product('006.jpg', 'Classic Gold Bangles', 'Gold', '₹2,18,000'),
  Product('007.jpg', 'Diamond Stud Earrings', 'Diamond', '₹98,750'),
  Product('008.jpg', 'Signature Solitaire Ring', 'Diamond', '₹1,36,000'),
  Product('009.jpg', 'Traditional Long Haram', 'Bridal', '₹3,92,000'),
  Product('010.jpg', 'Floral Diamond Studs', 'Diamond', '₹72,400'),
  Product('011.jpg', 'Petite Mangalsutra Pendant', 'Gold', '₹64,800'),
  Product('012.jpg', 'Diamond Bangle Set', 'Gold', '₹2,76,500'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController heroController = PageController();
  final TextEditingController searchController = TextEditingController();
  Timer? timer;
  int heroIndex = 0;
  int navIndex = 0;
  String selectedCategory = 'All';
  bool menuOpen = false;
  final Set<String> favorites = {};

  final heroSlides = const [
    ['001.jpg', 'Timeless beauty.', 'Crafted for the moments you keep forever.'],
    ['004.jpg', 'Made to be remembered.', 'Bridal pieces with heritage, colour and presence.'],
    ['009.jpg', 'A legacy you can wear.', 'Signature gold creations for every generation.'],
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      heroIndex = (heroIndex + 1) % heroSlides.length;
      heroController.animateToPage(heroIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    heroController.dispose();
    searchController.dispose();
    super.dispose();
  }

  List<Product> get visibleProducts {
    final query = searchController.text.trim().toLowerCase();
    return products.where((p) {
      final categoryMatch = selectedCategory == 'All' || p.category == selectedCategory;
      final textMatch = query.isEmpty || p.name.toLowerCase().contains(query) || p.category.toLowerCase().contains(query);
      return categoryMatch && textMatch;
    }).toList();
  }

  void setCategory(String category) => setState(() => selectedCategory = category);

  @override
  Widget build(BuildContext context) {
    final content = navIndex == 0
        ? _homeBody()
        : navIndex == 1
            ? _catalogBody()
            : navIndex == 2
                ? _savedBody()
                : _profileBody();

    return Scaffold(
      backgroundColor: espresso,
      body: SafeArea(
        child: Stack(
          children: [
            content,
            if (menuOpen) _drawer(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: navIndex == 0 ? _whatsappFab() : null,
    );
  }

  Widget _homeBody() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: _header()),
        SliverToBoxAdapter(child: _rateTicker()),
        SliverToBoxAdapter(child: _hero()),
        SliverToBoxAdapter(child: _quickCategories()),
        SliverToBoxAdapter(child: _metalRates()),
        SliverToBoxAdapter(child: _actionGrid()),
        SliverToBoxAdapter(child: _sectionHeader('Special Selection', 'Handpicked for you', () => setState(() => navIndex = 1))),
        SliverToBoxAdapter(child: _productRail(products.take(6).toList())),
        SliverToBoxAdapter(child: _sectionHeader('New Arrivals', 'Latest additions to the collection', () => setState(() => navIndex = 1))),
        SliverToBoxAdapter(child: _productRail(products.skip(6).toList())),
        SliverToBoxAdapter(child: _heritageBanner()),
        SliverToBoxAdapter(child: _visitCard()),
        const SliverToBoxAdapter(child: SizedBox(height: 110)),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
      child: Column(
        children: [
          Row(
            children: [
              _circleButton(Icons.menu, () => setState(() => menuOpen = true)),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(border: Border.all(color: gold.withOpacity(.8)), shape: BoxShape.circle),
                      child: Image.asset('assets/logo_mark.png', fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 9),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('POORNIMA', style: TextStyle(letterSpacing: 3.4, fontSize: 16, color: ivory, fontWeight: FontWeight.w700)),
                        Text('JEWELLERS', style: TextStyle(letterSpacing: 2.5, fontSize: 10.5, color: goldBright)),
                      ],
                    )
                  ],
                ),
              ),
              _circleButton(Icons.favorite_border, () => setState(() => navIndex = 2)),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(18), border: Border.all(color: gold.withOpacity(.35))),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(color: ivory),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: goldBright),
                suffixIcon: Icon(Icons.qr_code_scanner, color: goldBright),
                hintText: 'Search jewellery, gold, diamonds...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(shape: BoxShape.circle, color: panel, border: Border.all(color: gold.withOpacity(.45))),
        child: Icon(icon, size: 22, color: ivory),
      ),
    );
  }

  Widget _rateTicker() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF3A210F), Color(0xFF1E120C)]),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: gold.withOpacity(.55)),
      ),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle)),
          const SizedBox(width: 9),
          const Text('TODAY • BENGALURU', style: TextStyle(color: goldBright, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
          const Spacer(),
          const Text('22K  ₹14,040/g', style: TextStyle(color: ivory, fontWeight: FontWeight.w700, fontSize: 12)),
          const SizedBox(width: 12),
          const Text('View all →', style: TextStyle(color: goldBright, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _hero() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 4),
      child: AspectRatio(
        aspectRatio: 1.12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                controller: heroController,
                itemCount: heroSlides.length,
                onPageChanged: (i) => setState(() => heroIndex = i),
                itemBuilder: (_, i) => Image.asset('assets/images/${heroSlides[i][0]}', fit: BoxFit.cover),
              ),
              DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(.05), Colors.black.withOpacity(.9)]))),
              Positioned(
                left: 22,
                right: 22,
                bottom: 26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heroSlides[heroIndex][1].toUpperCase(), style: const TextStyle(color: goldBright, letterSpacing: 2.5, fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 5),
                    Text(heroSlides[heroIndex][2], style: const TextStyle(fontFamily: 'Georgia', fontSize: 23, height: 1.15, color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 14),
                    Row(children: [
                      _goldButton('EXPLORE COLLECTION', () => setState(() => navIndex = 1)),
                      const Spacer(),
                      Row(children: List.generate(heroSlides.length, (i) => Container(margin: const EdgeInsets.only(left: 5), width: i == heroIndex ? 20 : 7, height: 7, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: i == heroIndex ? goldBright : Colors.white38))))
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goldButton(String label, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(color: goldBright, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: gold.withOpacity(.25), blurRadius: 16)]),
        child: Text(label, style: const TextStyle(color: Color(0xFF231408), fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: .5)),
      ),
    );
  }

  Widget _quickCategories() {
    const cats = [
      ['Gold', Icons.workspace_premium_outlined],
      ['Diamond', Icons.diamond_outlined],
      ['Bridal', Icons.auto_awesome_outlined],
      ['Bangles', Icons.circle_outlined],
      ['Rings', Icons.panorama_fish_eye_outlined],
      ['Chains', Icons.link],
      ['Silver', Icons.toll_outlined],
    ];
    return SizedBox(
      height: 108,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 6),
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) {
          final active = selectedCategory == cats[i][0];
          return InkWell(
            onTap: () { setState(() { selectedCategory = cats[i][0] as String; navIndex = 1; }); },
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: 74,
              child: Column(children: [
                Container(width: 62, height: 62, decoration: BoxDecoration(shape: BoxShape.circle, color: active ? gold.withOpacity(.24) : panel, border: Border.all(color: active ? goldBright : gold.withOpacity(.45), width: active ? 1.5 : 1)), child: Icon(cats[i][1] as IconData, color: goldBright, size: 27)),
                const SizedBox(height: 7),
                Text(cats[i][0] as String, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: active ? goldBright : ivory.withOpacity(.85), fontSize: 11, fontWeight: FontWeight.w600))
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _metalRates() {
    final rates = const [
      ['24K', '₹15,317', '99.9%'],
      ['22K', '₹14,040', '91.6%'],
      ['18K', '₹11,488', '75%'],
      ['Silver', '₹245', 'per g'],
    ];
    return Column(
      children: [
        _sectionHeader('Today’s Metal Rate', 'Bengaluru · 16 Sep 2026 · Indicative', () {}),
        SizedBox(
          height: 154,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 6),
            scrollDirection: Axis.horizontal,
            itemCount: rates.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => Container(
              width: 145,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF342014), Color(0xFF1D120D)]),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: gold.withOpacity(.5)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(i == 3 ? Icons.toll_outlined : Icons.workspace_premium_outlined, color: goldBright, size: 23),
                const SizedBox(height: 10),
                Text(rates[i][0], style: const TextStyle(color: ivory, fontWeight: FontWeight.w800, fontSize: 15)),
                const SizedBox(height: 4),
                Text(rates[i][1], style: const TextStyle(color: goldBright, fontSize: 19, fontWeight: FontWeight.w900)),
                const Spacer(),
                Text(rates[i][2], style: const TextStyle(color: Colors.white54, fontSize: 10)),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionGrid() {
    final actions = [
      ['Advance Gold', 'Book, track & manage', Icons.account_balance_wallet_outlined],
      ['Advance Silver', 'Save in silver, simply', Icons.savings_outlined],
      ['Monthly Plan', 'Join a jewellery plan', Icons.calendar_month_outlined],
      ['Rate Calculator', 'Estimate gold value', Icons.calculate_outlined],
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 6),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: actions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 112, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemBuilder: (_, i) {
          return InkWell(
            onTap: () => _showInfo(actions[i][0] as String),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: i.isEven ? const Color(0xFF242016) : const Color(0xFF281A12), borderRadius: BorderRadius.circular(20), border: Border.all(color: gold.withOpacity(.30))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(actions[i][2] as IconData, color: goldBright, size: 25),
                const Spacer(),
                Text(actions[i][0] as String, style: const TextStyle(color: ivory, fontWeight: FontWeight.w800, fontSize: 14)),
                const SizedBox(height: 4),
                Row(children: [Expanded(child: Text(actions[i][1] as String, style: const TextStyle(color: Colors.white60, fontSize: 10))), const Icon(Icons.arrow_forward_ios, size: 10, color: goldBright)])
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _sectionHeader(String title, String subtitle, VoidCallback onArrow) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 18, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: ivory, fontSize: 20, fontWeight: FontWeight.w800)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 10))])),
          InkWell(onTap: onArrow, child: Row(children: const [Text('View all', style: TextStyle(color: goldBright, fontSize: 11)), SizedBox(width: 5), Icon(Icons.arrow_forward, color: goldBright, size: 16)]))
        ],
      ),
    );
  }

  Widget _productRail(List<Product> items) {
    return SizedBox(
      height: 294,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) => _productCard(items[i]),
      ),
    );
  }

  Widget _productCard(Product product) {
    final fav = favorites.contains(product.name);
    return InkWell(
      onTap: () => _showProduct(product),
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 190,
        decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(22), border: Border.all(color: gold.withOpacity(.30))),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Stack(children: [
              Positioned.fill(child: Image.asset('assets/images/${product.image}', fit: BoxFit.cover)),
              Positioned(top: 9, right: 9, child: InkWell(onTap: () => setState(() => fav ? favorites.remove(product.name) : favorites.add(product.name)), child: Container(width: 34, height: 34, decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle), child: Icon(fav ? Icons.favorite : Icons.favorite_border, size: 18, color: fav ? Colors.redAccent : ivory)))),
              Positioned(bottom: 9, left: 9, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: goldBright, borderRadius: BorderRadius.circular(8)), child: Text(product.category.toUpperCase(), style: const TextStyle(color: Color(0xFF22150B), fontWeight: FontWeight.w900, fontSize: 8))))
            ]),
          ),
          Padding(padding: const EdgeInsets.fromLTRB(12, 10, 12, 4), child: Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: ivory, fontSize: 13, fontWeight: FontWeight.w600))),
          Padding(padding: const EdgeInsets.fromLTRB(12, 0, 12, 12), child: Text(product.price, style: const TextStyle(color: goldBright, fontSize: 16, fontWeight: FontWeight.w900))),
        ]),
      ),
    );
  }

  Widget _heritageBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: SizedBox(
          height: 220,
          child: Stack(fit: StackFit.expand, children: [
            Image.asset('assets/images/005.jpg', fit: BoxFit.cover),
            DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.black.withOpacity(.88), Colors.transparent]))),
            Positioned(left: 20, top: 24, bottom: 24, width: 210, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('OUR HERITAGE', style: TextStyle(color: goldBright, letterSpacing: 2.2, fontSize: 10, fontWeight: FontWeight.w800)), const SizedBox(height: 8), const Text('Jewellery is more than an ornament.', style: TextStyle(color: ivory, fontFamily: 'Georgia', fontSize: 24, height: 1.1)), const Spacer(), _outlineButton('Discover Poornima', () => _showInfo('Poornima heritage'))]))
          ]),
        ),
      ),
    );
  }

  Widget _outlineButton(String label, VoidCallback onTap) {
    return InkWell(onTap: onTap, child: Container(padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9), decoration: BoxDecoration(border: Border.all(color: goldBright), borderRadius: BorderRadius.circular(12)), child: Text(label, style: const TextStyle(color: goldBright, fontSize: 10, fontWeight: FontWeight.w700))));
  }

  Widget _visitCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(22), border: Border.all(color: gold.withOpacity(.35))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('VISIT OUR SHOWROOM', style: TextStyle(color: goldBright, letterSpacing: 1.7, fontSize: 10, fontWeight: FontWeight.w800)),
          const SizedBox(height: 7),
          const Text('Poornima Jewellers', style: TextStyle(color: ivory, fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 7),
          const Text('#10, 1st Main Rd, Hosahalli Extension, Vijayanagar, Bengaluru, Karnataka 560104', style: TextStyle(color: Colors.white70, height: 1.45, fontSize: 11)),
          const SizedBox(height: 14),
          Row(children: [Expanded(child: _outlineButton('Get Directions', () => _showInfo('Directions'))), const SizedBox(width: 10), Expanded(child: _goldButton('Contact Us', () => _showInfo('Contact')))])
        ]),
      ),
    );
  }

  Widget _bottomNav() {
    return NavigationBar(
      backgroundColor: const Color(0xFF0F0805),
      indicatorColor: gold.withOpacity(.18),
      selectedIndex: navIndex,
      onDestinationSelected: (i) => setState(() { navIndex = i; menuOpen = false; }),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: goldBright), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view, color: goldBright), label: 'Shop'),
        NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite, color: Colors.redAccent), label: 'Saved'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: goldBright), label: 'Profile'),
      ],
    );
  }

  Widget _whatsappFab() {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xFF165C30),
      foregroundColor: Colors.white,
      onPressed: () => _showInfo('WhatsApp enquiry'),
      icon: const Icon(Icons.chat_bubble_outline),
      label: const Text('Enquire', style: TextStyle(fontWeight: FontWeight.w800)),
    );
  }

  Widget _catalogBody() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: _header()),
        SliverToBoxAdapter(child: _categoryFilters()),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(20, 18, 20, 10), child: Text('${visibleProducts.length} pieces', style: const TextStyle(color: goldBright, fontWeight: FontWeight.w700)))),
        SliverPadding(padding: const EdgeInsets.fromLTRB(18, 0, 18, 30), sliver: SliverGrid(delegate: SliverChildBuilderDelegate((_, i) => _productCard(visibleProducts[i]), childCount: visibleProducts.length), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 295, crossAxisSpacing: 12, mainAxisSpacing: 14))),
      ],
    );
  }

  Widget _categoryFilters() {
    final cats = ['All', 'Gold', 'Diamond', 'Bridal', 'Bangles', 'Rings', 'Chains', 'Silver'];
    return SizedBox(height: 49, child: ListView.separated(padding: const EdgeInsets.symmetric(horizontal: 18), scrollDirection: Axis.horizontal, itemCount: cats.length, separatorBuilder: (_, __) => const SizedBox(width: 8), itemBuilder: (_, i) => ChoiceChip(label: Text(cats[i]), selected: selectedCategory == cats[i], onSelected: (_) => setCategory(cats[i]), selectedColor: gold.withOpacity(.25), backgroundColor: panel, labelStyle: TextStyle(color: selectedCategory == cats[i] ? goldBright : ivory.withOpacity(.75), fontSize: 11, fontWeight: FontWeight.w700), side: BorderSide(color: gold.withOpacity(.35)))));
  }

  Widget _savedBody() {
    final saved = products.where((p) => favorites.contains(p.name)).toList();
    return CustomScrollView(slivers: [SliverToBoxAdapter(child: _header()), SliverToBoxAdapter(child: _sectionHeader('Saved Pieces', saved.isEmpty ? 'Your wishlist is waiting' : '${saved.length} saved', () {})), if (saved.isEmpty) SliverToBoxAdapter(child: _emptyState(Icons.favorite_border, 'No saved jewellery yet', 'Tap the heart on any piece to keep it here.')) else SliverPadding(padding: const EdgeInsets.all(18), sliver: SliverGrid(delegate: SliverChildBuilderDelegate((_, i) => _productCard(saved[i]), childCount: saved.length), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 295, crossAxisSpacing: 12, mainAxisSpacing: 14))) ]);
  }

  Widget _profileBody() {
    return ListView(padding: const EdgeInsets.fromLTRB(18, 18, 18, 30), children: [
      _header(),
      const SizedBox(height: 15),
      Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF3B2410), Color(0xFF1D110B)]), borderRadius: BorderRadius.circular(24), border: Border.all(color: gold.withOpacity(.35))), child: Row(children: [Container(width: 56, height: 56, padding: const EdgeInsets.all(5), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: goldBright)), child: Image.asset('assets/logo_mark.png')), const SizedBox(width: 14), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Poornima Jewellers', style: TextStyle(fontSize: 20, color: ivory, fontWeight: FontWeight.w800)), SizedBox(height: 3), Text('Tradition • Trust • Timeless beauty', style: TextStyle(color: Colors.white54, fontSize: 11))]))])),
      const SizedBox(height: 16),
      ...['My enquiries', 'Advance bookings', 'Jewellery savings plans', 'Visit showroom', 'About Poornima'].map((x) => ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 8), leading: const Icon(Icons.chevron_right, color: goldBright), title: Text(x, style: const TextStyle(color: ivory, fontWeight: FontWeight.w600)), onTap: () => _showInfo(x))).toList(),
    ]);
  }

  Widget _emptyState(IconData icon, String title, String message) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 90), child: Column(children: [Icon(icon, color: goldBright, size: 50), const SizedBox(height: 15), Text(title, style: const TextStyle(color: ivory, fontSize: 20, fontWeight: FontWeight.w800)), const SizedBox(height: 8), Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white54, height: 1.5))]));
  }

  Widget _drawer() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(.72),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 310,
            height: double.infinity,
            color: const Color(0xFF130B08),
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [Container(width: 46, height: 46, padding: const EdgeInsets.all(4), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: gold)), child: Image.asset('assets/logo_mark.png')), const SizedBox(width: 10), const Text('POORNIMA JEWELLERS', style: TextStyle(color: ivory, letterSpacing: 1.5, fontWeight: FontWeight.w800)), const Spacer(), IconButton(onPressed: () => setState(() => menuOpen = false), icon: const Icon(Icons.close, color: ivory))]),
              const SizedBox(height: 28),
              ...[
                ['Home', Icons.home_outlined, 0], ['Shop', Icons.grid_view_outlined, 1], ['Saved', Icons.favorite_border, 2], ['Profile', Icons.person_outline, 3]
              ].map((x) => ListTile(onTap: () => setState(() { navIndex = x[2] as int; menuOpen = false; }), leading: Icon(x[1] as IconData, color: goldBright), title: Text(x[0] as String, style: const TextStyle(color: ivory, fontWeight: FontWeight.w600)))).toList(),
              const Spacer(),
              const Text('SHOWROOM', style: TextStyle(color: goldBright, letterSpacing: 2, fontWeight: FontWeight.w800, fontSize: 10)),
              const SizedBox(height: 6),
              const Text('#10, 1st Main Rd, Hosahalli Extension, Vijayanagar, Bengaluru 560104', style: TextStyle(color: Colors.white60, height: 1.45, fontSize: 11)),
            ]),
          ),
        ),
      ),
    );
  }

  void _showProduct(Product p) {
    showModalBottomSheet(
      context: context,
      backgroundColor: panel,
      showDragHandle: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              p.category.toUpperCase(),
              style: const TextStyle(
                color: goldBright,
                letterSpacing: 1.5,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              p.name,
              style: const TextStyle(
                color: ivory,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              p.price,
              style: const TextStyle(
                color: goldBright,
                fontSize: 21,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _outlineButton(
                    'Save',
                    () {
                      setState(() => favorites.add(p.name));
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _goldButton(
                    'Enquire',
                    () {
                      Navigator.pop(context);
                      _showInfo('Enquire: ${p.name}');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showInfo(String title) {
    showDialog(context: context, builder: (_) => AlertDialog(backgroundColor: panel, title: Text(title, style: const TextStyle(color: ivory, fontWeight: FontWeight.w800)), content: const Text('This experience is ready for Poornima’s showroom enquiry, booking and contact flow. Connect the final action to your preferred backend/WhatsApp/phone endpoint.', style: TextStyle(color: Colors.white70, height: 1.5)), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close', style: TextStyle(color: goldBright)))]));
  }
}
