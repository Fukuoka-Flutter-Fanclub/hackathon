import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackathon/flavors.dart';

class SupabaseConfig {
  const SupabaseConfig();

  Future<String> supabaseURL() async {
    await dotenv.load(fileName: ".env");
    switch (F.appFlavor) {
      case Flavor.dev:
        return dotenv.env['SUPABASE_URL_DEV'] ?? '';
      case Flavor.prod:
        return dotenv.env['SUPABASE_URL_PROD'] ?? '';
      default:
        return 'title';
    }
  }

  Future<String> supabaseAnonKey() async {
    await dotenv.load(fileName: ".env");
    switch (F.appFlavor) {
      case Flavor.dev:
        return dotenv.env['SUPABASE_ANON_KEY_DEV'] ?? '';
      case Flavor.prod:
        return dotenv.env['SUPABASE_ANON_KEY_PROD'] ?? '';
      default:
        return 'title';
    }
  }
}
