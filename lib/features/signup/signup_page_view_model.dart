import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/signup/signup_page_state.dart';
import 'package:hackathon/features/snack_bar.dart';
import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final signupPageViewModel =
    StateNotifierProvider<SignupPageNotifier, SignupPageState>(
  SignupPageNotifier.new,
);

class SignupPageNotifier extends StateNotifier<SignupPageState>
    with WidgetsBindingObserver {
  SignupPageNotifier(this._ref)
      : super(
          SignupPageState(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            userNameController: TextEditingController(),
          ),
        );

  final Ref _ref;

  SupabaseAuthRepository get supabaseAuth => _ref.read(supabaseAuthProvider);

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> changeVisible() async {
    state = state.copyWith(passwordVisible: !state.passwordVisible);
  }

  Future<void> signin(BuildContext context) async {
    if (state.userNameController.text.isEmpty) {
      showCustomSnackBar(
        ['user error', 'ユーザー名を入力してください'],
        context,
      );
    } else if (state.emailController.text.isEmpty ||
        !state.emailController.text.contains('@')) {
      showCustomSnackBar(
        ['email error', '有効なメールアドレスを入力してください'],
        context,
      );
    } else if (state.passwordController.text.length < 8) {
      showCustomSnackBar(
        ['password error', 'パスワードが短すぎます！'],
        context,
      );
    }
    try {
      await supabaseAuth.createAccount(
        email: state.emailController.text,
        password: state.passwordController.text,
        userName: state.userNameController.text,
      );
      showCustomSnackBar(
        ['確認メールを送信', 'メールを確認してください'],
        context,
        color: Colors.green,
      );
    } on AuthException catch (error) {
      showCustomSnackBar(
        ['エラー', error.message],
        context,
      );
    }
  }
}
