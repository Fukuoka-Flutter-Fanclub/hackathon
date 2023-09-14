import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  const SupabaseAuthService();

  static final _supabase = Supabase.instance.client;

  Future<void> signInWithGoogle({required String idToken}) async {
    await _supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
    );
  }
}
