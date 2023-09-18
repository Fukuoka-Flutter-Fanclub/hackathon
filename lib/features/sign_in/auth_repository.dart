import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/core/data/secure_storage_datasource.dart';
import 'package:hackathon/features/sign_in/google_auth_service.dart';
import 'package:hackathon/features/sign_in/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final authRepositoryProvider = Provider((ref) => AuthRepository(ref: ref));

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  GoogleAuthService get googleAuth => ref.read(googleAuthServiceProvider);

  SupabaseAuthService get supabaseAuth => ref.read(supabaseAuthProvider);

  SecureStorageDatasource get secureStorage =>
      ref.read(secureStorageDatasourceProvider);

  static const _refreshTokenKey = 'google_auth_refresh_token';

  bool isEmailValid(String email) => email.isNotEmpty && email.contains('@');

  bool isPasswordValid(String password) => password.length >= 8;

  Future<bool> signInByGoogle() async {
    final (idToken, accessToken) = await googleAuth.tokensByGoogleSignIn();
    if (idToken == null || accessToken == null) {
      return false;
    }

    final refreshToken = await supabaseAuth.signInWithGoogle(
      idToken: idToken,
      accessToken: accessToken,
    );
    if (refreshToken == null) {
      return false;
    }

    await secureStorage.write(
      key: _refreshTokenKey,
      value: refreshToken,
    );
    return true;
  }

  Future<bool> signInByRefreshToken() async {
    final refreshToken = await secureStorage.read(key: _refreshTokenKey);
    if (refreshToken == null) {
      return false;
    }

    final (idToken, accessToken) =
        await googleAuth.idTokenByRefreshToken(refreshToken);
    if (idToken == null || accessToken == null) {
      await secureStorage.delete(key: _refreshTokenKey);
      return false;
    }

    await supabaseAuth.signInWithGoogle(
      idToken: idToken,
      accessToken: accessToken,
    );
    return true;
  }

  Future<String> loginByEmail({
    required String email,
    required String password,
  }) async {
    try {
      await supabaseAuth.emailLogin(
        email: email,
        password: password,
      );
      return '200';
    } on supabase.AuthException catch (e) {
      return e.statusCode ?? '500';
    }
  }

  Future<String> signinByEmail({
    required String email,
    required String password,
  }) async {
    try {
      await supabaseAuth.emailSignin(
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
    await supabaseAuth.signOut(
      onComplete: () async {
        await secureStorage.delete(key: _refreshTokenKey);
      },
    );
  }
}
