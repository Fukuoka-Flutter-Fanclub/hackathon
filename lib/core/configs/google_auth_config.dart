import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackathon/flavors.dart';

final class GoogleAuthConfig {
  const GoogleAuthConfig._();

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