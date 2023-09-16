import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/provider/supabase/supabase_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;

final supabaseAuthProvider = Provider(SupabaseAuthRepository.new);

class SupabaseAuthRepository {
  const SupabaseAuthRepository(this._ref);

  final Ref _ref;

  sup.SupabaseClient get supabase => _ref.watch(supabaseProvider);

  sup.Session? get authState => supabase.auth.currentSession;

  Stream<sup.AuthState> get onAuthStateChange =>
      supabase.auth.onAuthStateChange;

  Future<sup.AuthResponse> emailSignin({
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth
        .signInWithPassword(email: email, password: password);
    return response;
  }

  Future<sup.AuthResponse> createAccount({
    required String email,
    required String password,
    required String userName,
  }) async {
    final response = await supabase.auth.signUp(
      password: password,
      email: email,
      data: {
        'username': userName,
      },
    );
    return response;
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await supabase.auth.resetPasswordForEmail(email);
  }
}
