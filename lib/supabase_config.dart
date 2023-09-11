import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackathon/flavors.dart';

class SupabaseConfig {

  const SupabaseConfig._();

  static String url = switch (F.appFlavor) {
    Flavor.dev => dotenv.env['SUPABASE_URL_DEV'] ?? '',
    Flavor.prod => dotenv.env['SUPABASE_URL_PROD'] ?? '',
  };

  static String anonKey = switch (F.appFlavor) {
    Flavor.dev => dotenv.env['SUPABASE_ANON_KEY_DEV'] ?? '',
    Flavor.prod => dotenv.env['SUPABASE_ANON_KEY_PROD'] ?? '',
  };

}
