import 'dart:io';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/flavors.dart';

final googleAuthServiceProvider = Provider((_) => const GoogleAuthService());

class GoogleAuthService {
  const GoogleAuthService();

  static const _auth = FlutterAppAuth();

  Future<(String? idToken, String? accessToken)> tokensByGoogleSignIn() async {
    final request = AuthorizationTokenRequest(
      _GoogleAuthConfig.clientID,
      _GoogleAuthConfig.redirectURL,
      issuer: _GoogleAuthConfig.issuer,
      scopes: _GoogleAuthConfig.scopes,
    );
    final tokenResponse = await _auth.authorizeAndExchangeCode(request);
    return (tokenResponse?.idToken, tokenResponse?.accessToken);
  }

  Future<(String? idToken, String? accessToken)> idTokenByRefreshToken(
    String refreshToken,
  ) async {
    final request = TokenRequest(
      _GoogleAuthConfig.clientID,
      _GoogleAuthConfig.redirectURL,
      issuer: _GoogleAuthConfig.issuer,
      scopes: _GoogleAuthConfig.scopes,
      refreshToken: refreshToken,
    );
    final response = await _auth.token(request);
    return (response?.idToken, response?.accessToken);
  }
}

final class _GoogleAuthConfig {
  const _GoogleAuthConfig._();

  static String get _androidClientID => switch (F.appFlavor) {
        Flavor.dev => dotenv.env['GOOGLE_AUTH_CLIENT_ID_ANDROID_DEV'] ?? '',
        Flavor.prod => dotenv.env['GOOGLE_AUTH_CLIENT_ID_ANDROID_PROD'] ?? '',
      };

  static String get _iosClientID => switch (F.appFlavor) {
        Flavor.dev => dotenv.env['GOOGLE_AUTH_CLIENT_ID_IOS_DEV'] ?? '',
        Flavor.prod => dotenv.env['GOOGLE_AUTH_CLIENT_ID_IOS_PROD'] ?? '',
      };

  static String get _osClientID {
    if (Platform.isAndroid) {
      return _androidClientID;
    } else if (Platform.isIOS) {
      return _iosClientID;
    } else {
      assert(false);
      throw Exception('Operating System is not Mobile');
    }
  }

  static String get clientID => '$_osClientID.apps.googleusercontent.com';

  static String get redirectURL =>
      'com.googleusercontent.apps.$_osClientID:/oauthredirect';

  static String get issuer => 'https://accounts.google.com';

  static List<String> get scopes => ['email'];
}
