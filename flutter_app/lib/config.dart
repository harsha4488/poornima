class AppConfig {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabasePublishableKey = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');
  static const currency = 'INR';
  static const storeName = 'Poornima Jewellers';
  static const storeAddress = '#10, 1st Main Rd, Hosahalli Extension, Vijayanagar, Bengaluru, Karnataka 560104';
  static const mapsUrl = 'https://www.google.com/maps/dir//Poornima+Jewellers,+1st+Main+Rd,+Hosahalli+Extension,+Vijayanagar,+Bengaluru,+Karnataka+560104/@12.96662,77.467714,13z/data=!4m18!1m8!3m7!1s0x3bae3de191a1beed:0xe02a9c7ef2fda275!2sPoornima+Jewellers!8m2!3d12.96662!4d77.5439317!15sChxQb29ybmltYSBKZXdlbGxlcnMgQmVuZ2FsdXJ1kgENamV3ZWxsZXJ5X3N0b3JlkgENamV3ZWxsZXJ5X3N0b3Jl4m0?entry=ttu&g_ep=EgoyMDI2MDkwOS4wIKXMDSoASAFQAw%3D%3D';
  static const instagramUrl = 'https://www.instagram.com/popular/poornima-jewellers-vijayanagar/';

  static bool get isConfigured => supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
}
