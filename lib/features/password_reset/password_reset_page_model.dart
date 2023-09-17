import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;

final passwordResetPageController =
    Provider((ref) => PasswordResetPageController(ref));

class PasswordResetPageController {
  PasswordResetPageController(this._ref);

  final Ref _ref;

  SupabaseAuthRepository get _supabaseAuth => _ref.read(supabaseAuthProvider);

  bool isEmailValid(String email) => email.isNotEmpty || email.contains('@');

  Future<String> submit(String email) async {
    try {
      await _supabaseAuth.resetPassword(
        email: email,
      );
      return '200';
    } on sup.AuthException catch (e) {
      return e.statusCode ?? '500';
    }
  }
}
