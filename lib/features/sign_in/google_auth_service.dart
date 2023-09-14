import 'dart:io';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:hackathon/flavors.dart';

class GoogleAuthService {
  const GoogleAuthService();

  static const _auth = FlutterAppAuth();

  Future<String?> getIdTokenByGoogle() async {
    final tokenResponse = await _auth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _GoogleAuthConfig.clientID,
        _GoogleAuthConfig.redirectURL,
        issuer: _GoogleAuthConfig.issuer,
        scopes: _GoogleAuthConfig.scopes,
      ),
    );
    return tokenResponse?.idToken;
  }
}

final class _GoogleAuthConfig {
  const _GoogleAuthConfig._();

  static String get _androidClientID => switch (F.appFlavor) {
        Flavor.dev => '1040972633522-dlf026h20c0ksa2ci85c8fochlmjmhgl',
        Flavor.prod => '', //TODO: add ClientID
      };

  static String get _iosClientID => switch (F.appFlavor) {
        Flavor.dev => '', //TODO: add ClientID
        Flavor.prod => '', //TODO: add ClientID
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

  static String get redirectURL => 'com.googleusercontent.apps.$_osClientID';

  static String get issuer => 'https://accounts.google.com';

  static List<String> get scopes => ['email'];
}
