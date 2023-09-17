import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';

final authTextEditingControllers = AutoDisposeProvider(
  (_) => AuthTextEditingControllers.init(),
);

final class AuthTextEditingControllers {
  AuthTextEditingControllers.init()
      : this._(
          List.generate(3, (_) => TextEditingController(), growable: false),
        );

  AuthTextEditingControllers._(this.controllers);

  final List<TextEditingController> controllers;

  TextEditingController get email => controllers[0];

  TextEditingController get password => controllers[1];

  TextEditingController get userName => controllers[2];

  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
  }

  bool get isEmailValid => email.text.contains('@');

  bool get isPasswordValid => password.text.length >= 6;
}

final epLoginController = Provider(
  (ref) => EPLoginController(ref),
);

final class EPLoginController {
  const EPLoginController(this._ref);

  final Ref _ref;

  SupabaseAuthRepository get _supabaseAuth => _ref.read(supabaseAuthProvider);

  Future<bool> emailSignIn({
    required String email,
    required String password,
  }) async {
    final response = await _supabaseAuth.emailSignin(
      email: email,
      password: password,
    );
    return response.session != null;
  }
}
