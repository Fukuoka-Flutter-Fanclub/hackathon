import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final supabaseAuthProvider = Provider((_) => const SupabaseAuthService());

class SupabaseAuthService {
  const SupabaseAuthService();

  static final _supabase = supabase.Supabase.instance.client;

  Future<String?> signInWithGoogle({
    required String idToken,
    required String accessToken,
  }) async {
    final response = await _supabase.auth.signInWithIdToken(
      provider: supabase.Provider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    return response.session?.refreshToken;
  }

  Future<void> emailLogin({
    required String email,
    required String password,
  }) async {
    await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> emailSignin({
    required String email,
    required String password,
  }) async {
    await _supabase.auth.signUp(
      password: password,
      email: email,
    );
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  Future<void> signOut({FutureOr<void> Function()? onComplete}) async {
    await _supabase.auth.signOut();
    await onComplete?.call();
  }
}
