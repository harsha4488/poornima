const goldNames = [
  'Temple Bloom Necklace', 'Lakshmi Jhumka', 'Filigree Heritage Bangle', 'Classic Nakshi Ring', 'Mango Motif Pendant',
  'Antique Peacock Earrings', 'Ruby Drop Haram', 'Green Stone Necklace', 'Lotus Gold Studs', 'Traditional Vanki Bangle',
  'Pearl Jhumka Pair', 'Classic Daily Chain', 'Royal Coin Necklace', 'Floral Kada', 'Heritage Pendant',
  'Peacock Layered Haar', 'Ruby Leaf Necklace', 'Gold Hoop Pair', 'Engraved Kada', 'Lakshmi Pendant',
  'Temple Guttapusalu', 'Classic Link Bracelet', 'Emerald Drop Earrings', 'Designer Gold Ring', 'Antique Choker'
];
const diamondNames = [
  'Solitaire Bloom Ring', 'Cluster Petal Studs', 'Halo Pearl Drops', 'Eternal Line Bracelet', 'Brilliant Leaf Ring',
  'Diamond Teardrop Pendant', 'Classic Tennis Bracelet', 'Dainty Floral Earrings', 'Infinity Halo Ring', 'Pearl Diamond Drops',
  'Radiant Cluster Ring', 'Petite Star Studs', 'Contemporary Diamond Band', 'Grace Pendant', 'Marquise Bloom Ring',
  'Classic Diamond Hoop', 'Double Halo Ring', 'Sapphire Accent Studs', 'Luna Diamond Bracelet', 'Heritage Diamond Drops'
];
const silverNames = [
  'Silver Filigree Bangle', 'Lotus Silver Pendant', 'Classic Silver Band', 'Floral Silver Bracelet', 'Oxidised Jhumka',
  'Silver Peacock Drops', 'Leaf Motif Anklet', 'Silver Pearl Earrings', 'Temple Silver Kada', 'Contemporary Silver Ring',
  'Silver Link Bracelet', 'Paisley Silver Pendant', 'Filigree Stud Pair', 'Silver Chain Necklace', 'Floral Kada Pair',
  'Minimal Silver Band', 'Moonlight Bracelet', 'Silver Ganesha Pendant', 'Classic Kolhapuri Jhumka', 'Silver Stone Drops',
  'Twist Silver Bangle', 'Dome Jhumka Pair', 'Silver Leaf Chain', 'Lotus Anklet', 'Silver Heart Pendant'
];
const bridalNames = [
  'Bridal Ruby Haar', 'Bridal Emerald Set', 'Kundan Choker Set', 'Bridal Jhumka Set', 'Temple Bridal Necklace',
  'Ruby Guttapusalu', 'Bridal Peacock Haar', 'Emerald Bridal Choker', 'Bridal Kundan Drops', 'Meenakari Bridal Set',
  'Heritage Bridal Haar', 'Bridal Long Haram', 'Ruby Lakshmi Set', 'Emerald Mango Haar', 'Bridal Pearl Choker',
  'Antique Bridal Set', 'Bridal Layered Necklace', 'Royal Kundan Set', 'Bridal Waist Belt', 'Bridal Vanki Set',
  'Ruby Temple Set', 'Green Stone Bridal Set', 'Bridal Floral Choker', 'Heritage Jhumka Set', 'Bridal Navratan Set',
  'Bridal Pendant Set', 'Traditional Bridal Haar', 'Classic Wedding Choker', 'Royal Bridal Earrings', 'Grand Bridal Necklace'
];

String typeFor(int i, String category) {
  final values = switch (category) {
    'Gold' => const ['Necklace', 'Earrings', 'Bangle', 'Ring', 'Pendant'],
    'Diamond' => const ['Ring', 'Earrings', 'Bracelet', 'Pendant', 'Studs'],
    'Silver' => const ['Bangle', 'Pendant', 'Ring', 'Bracelet', 'Earrings'],
    _ => const ['Necklace Set', 'Choker Set', 'Jhumka Set', 'Haar', 'Bridal Set'],
  };
  return values[i % values.length];
}
String finishFor(String category, int i) {
  if (category == 'Silver') return i.isEven ? 'Oxidised' : 'High Polish';
  if (category == 'Diamond') return i.isEven ? 'High Polish' : 'Mirror Finish';
  if (category == 'Bridal') return i % 3 == 0 ? 'Antique Gold' : 'Temple Finish';
  return i % 3 == 0 ? 'Antique Gold' : 'High Polish';
}
String stoneFor(String category, int i) {
  if (category == 'Silver') return i % 3 == 0 ? 'CZ' : 'None';
  if (category == 'Diamond') return i % 3 == 0 ? 'Diamond + Sapphire' : 'Diamond';
  if (category == 'Bridal') return i % 3 == 0 ? 'Kundan + Ruby' : (i.isEven ? 'Emerald + Ruby' : 'Kundan');
  return i % 4 == 0 ? 'Ruby + Emerald' : (i.isEven ? 'Emerald' : 'Ruby');
}
double weightFor(int i, String category) {
  if (category == 'Diamond') return 2.2 + (i % 7) * .8;
  if (category == 'Silver') return 6 + (i % 10) * 2.4;
  if (category == 'Bridal') return 28 + (i % 12) * 3.5;
  return 5.5 + (i % 14) * 2.3;
}

List<Map<String, dynamic>> seedProducts() {
  final groups = <String, List<String>>{'Gold': goldNames, 'Diamond': diamondNames, 'Silver': silverNames, 'Bridal': bridalNames};
  final out = <Map<String, dynamic>>[];
  var i = 1;
  groups.forEach((category, names) {
    for (final name in names) {
      final code = i.toString().padLeft(3, '0');
      // These are starter catalogue amounts only. Replace them with verified retail prices in Supabase before enabling payments.
      final baseRupees = category == 'Silver' ? 2500 + i * 175 : category == 'Diamond' ? 18000 + i * 1200 : category == 'Bridal' ? 75000 + i * 2600 : 18000 + i * 1400;
      out.add({
        'code': 'PJ-$code', 'name': name, 'category': category, 'type': typeFor(i, category), 'finish': finishFor(category, i),
        'stone': stoneFor(category, i), 'weight_grams': weightFor(i, category), 'purity': category == 'Silver' ? '925 Silver' : category == 'Diamond' ? '18K Gold / Diamond' : '22K Gold',
        'price_paise': baseRupees * 100, 'featured': i <= 12, 'is_active': true, 'image_path': 'assets/products/$code.jpg',
      });
      i++;
    }
  });
  return out;
}
