import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;

final signupPageController = Provider((ref) => SignupPageControllers(ref));

class SignupPageControllers {
  SignupPageControllers(this._ref);

  final Ref _ref;

  SupabaseAuthRepository get _supabaseAuth => _ref.read(supabaseAuthProvider);

  bool isEmailValid(String email) => email.isNotEmpty || email.contains('@');

  bool isPasswordValid(String password) => password.length >= 8;

  Future<String> submit({
    required String email,
    required String password,
  }) async {
    try {
      await _supabaseAuth.createAccount(
        email: email,
        password: password,
      );
      return '200';
    } on sup.AuthException catch (e) {
      return e.statusCode ?? '500';
    }
  }
}
