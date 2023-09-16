import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/signup/signup_page_state.dart';
import 'package:hackathon/features/snack_bar.dart';
import 'package:hackathon/provider/supabase/supabase_auth_provider.dart';

final loginPageProvider =
    StateNotifierProvider<LoginPageNotifier, SignupPageState>(
  LoginPageNotifier.new,
);

class LoginPageNotifier extends StateNotifier<SignupPageState>
    with WidgetsBindingObserver {
  LoginPageNotifier(this._ref)
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

  Future<void> submit(BuildContext context) async {
    if (!state.emailController.text.contains('@')) {
      showCustomSnackBar(
        ['メールアドレス入力エラー', '有効なメールアドレスを入力してください'],
        context,
      );
    }
    if (state.passwordController.text.length < 6) {
      showCustomSnackBar(
        ['パスワード入力エラー', 'パスワードは6文字以上で入力してください'],
        context,
      );
    } else {
      final responce = await supabaseAuth.emailSignin(
        email: state.emailController.text,
        password: state.passwordController.text,
      );
      if (responce.session != null && mounted) {
        context.go(HomePage.routeName);
      }
    }
  }
}
