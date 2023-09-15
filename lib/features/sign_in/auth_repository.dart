import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/core/data/secure_storage_datasource.dart';
import 'package:hackathon/features/sign_in/google_auth_service.dart';
import 'package:hackathon/features/sign_in/supabase_auth_service.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref: ref));

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  GoogleAuthService get googleAuth => ref.read(googleAuthServiceProvider);

  SupabaseAuthService get supabaseAuth => ref.read(supabaseAuthProvider);

  SecureStorageDatasource get secureStorage =>
      ref.read(secureStorageDatasourceProvider);

  static const _refreshTokenKey = 'google_auth_refresh_token';

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

  Future<void> signOut() async {
    await supabaseAuth.signOut(
      onComplete: () async {
        await secureStorage.delete(key: _refreshTokenKey);
      },
    );
  }
}
