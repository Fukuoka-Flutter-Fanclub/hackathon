import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/core/configs/google_auth_config.dart';

final googleAuthServiceProvider = Provider((_) => const GoogleAuthService());

class GoogleAuthService {
  const GoogleAuthService();

  static const _auth = FlutterAppAuth();

  Future<(String? idToken, String? accessToken)> tokensByGoogleSignIn() async {
    final request = AuthorizationTokenRequest(
      GoogleAuthConfig.clientID,
      GoogleAuthConfig.redirectURL,
      issuer: GoogleAuthConfig.issuer,
      scopes: GoogleAuthConfig.scopes,
    );
    final tokenResponse = await _auth.authorizeAndExchangeCode(request);
    return (tokenResponse?.idToken, tokenResponse?.accessToken);
  }

  Future<(String? idToken, String? accessToken)> idTokenByRefreshToken(
    String refreshToken,
  ) async {
    final request = TokenRequest(
      GoogleAuthConfig.clientID,
      GoogleAuthConfig.redirectURL,
      issuer: GoogleAuthConfig.issuer,
      scopes: GoogleAuthConfig.scopes,
      refreshToken: refreshToken,
    );
    final response = await _auth.token(request);
    return (response?.idToken, response?.accessToken);
  }
}

