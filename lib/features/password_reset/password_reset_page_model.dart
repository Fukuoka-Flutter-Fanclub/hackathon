import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/password_reset/password_reset_page_state.dart';
import 'package:hackathon/features/snack_bar.dart';
import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final passwordResetPageViewModel =
    StateNotifierProvider<PasswordResetPageNotifier, PasswordResetPageState>(
  PasswordResetPageNotifier.new,
);

class PasswordResetPageNotifier extends StateNotifier<PasswordResetPageState>
    with WidgetsBindingObserver {
  PasswordResetPageNotifier(this._ref)
      : super(
          PasswordResetPageState(
            emailController: TextEditingController(),
          ),
        );

  final Ref _ref;

  SupabaseAuthRepository get supabaseAuth => _ref.read(supabaseAuthProvider);

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> submit(BuildContext context) async {
    if (state.emailController.text.isEmpty ||
        !state.emailController.text.contains('@')) {
      showCustomSnackBar(
        ['email error', '有効なメールアドレスを入力してください'],
        context,
      );
    }
    try {
      await supabaseAuth.resetPassword(
        email: state.emailController.text,
      );
    } on AuthException catch (error) {
      showCustomSnackBar(
        ['エラー', error.message],
        context,
      );
    }
  }
}
