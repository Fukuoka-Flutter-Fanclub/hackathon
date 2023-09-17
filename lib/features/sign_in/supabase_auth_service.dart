import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/core/configs/google_auth_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final supabaseAuthProvider = Provider((_) => const SupabaseAuthService());

final authChangedProvider = StreamProvider((ref) {
  return ref.watch(supabaseAuthProvider).authStateChanged();
});

class SupabaseAuthService {
  const SupabaseAuthService();

  static final _supabase = supabase.Supabase.instance.client;

  Future<bool> signInWithGoogle() async {
    final result = await _supabase.auth.signInWithOAuth(
      supabase.Provider.google,
      redirectTo: GoogleAuthConfig.redirectURL,
    );
    return result;
  }

  Future<void> signOut({
    FutureOr<void> Function()? onComplete,
  }) async {
    await _supabase.auth.signOut();
    await onComplete?.call();
  }

  Stream<supabase.AuthState> authStateChanged() =>
      _supabase.auth.onAuthStateChange;
}
