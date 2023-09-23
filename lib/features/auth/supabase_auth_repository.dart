import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/auth/google_auth_service.dart';
import 'package:hackathon/features/auth/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final authRepositoryProvider = Provider((ref) => AuthRepository(ref: ref));

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  GoogleAuthService get googleAuth => ref.read(googleAuthServiceProvider);

  SupabaseAuthService get supabaseAuth => ref.read(supabaseAuthProvider);

  bool isEmailValid(String email) => email.contains('@');

  bool isPasswordValid(String password) => password.length >= 8;

  Future<String> logInByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseAuth.logInWithEmail(
        email: email,
        password: password,
      );
      return response.session?.user.emailConfirmedAt == null ? '400' : '200';
    } on supabase.AuthException catch (e) {
      return e.statusCode ?? '500';
    }
  }

  Future<String> signInByEmail({
    required String email,
    required String password,
  }) async {
    try {
      await supabaseAuth.signInWithEmail(
        email: email,
        password: password,
      );
      return '200';
    } on supabase.AuthException catch (e) {
      return e.statusCode ?? '500';
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      await supabaseAuth.resetPassword(
        email: email,
      );
      return '200';
    } on supabase.AuthException catch (e) {
      return e.statusCode ?? '500';
    }
  }

  Future<void> signOut() async {
    await supabaseAuth.signOut();
  }
}
