import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/component/snack_bar.dart';
import 'package:hackathon/features/email_verification/email_verification_dialog.dart';
import 'package:hackathon/features/sign_in/auth_repository.dart';
import 'package:hackathon/features/sign_in/view/login_page.dart';

class SigninPage extends ConsumerStatefulWidget {
  const SigninPage({super.key});

  static String routeName = 'signup';

  @override
  ConsumerState<SigninPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = false;

  Future<void> _signup() async {
    final authRepository = ref.watch(authRepositoryProvider);
    if (authRepository.isEmailValid(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: 'email error \n 有効なメールアドレスを入力してください',
        ) as SnackBar,
      );
    } else if (authRepository.isPasswordValid(passwordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: 'password errorr \n パスワードが短すぎます！',
        ) as SnackBar,
      );
    }
    final statusCode = await authRepository.loginByEmail(
      email: emailController.text,
      password: passwordController.text,
    );
    if (!mounted) {
      return;
    }
    if (statusCode == '200') {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const EmailVerificationDialog();
        },
      );
    } else if (statusCode == '400') {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: '登録エラー \n こちらのメールアドレスはすでに登録されています',
        ) as SnackBar,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: 'エラー \n 予期せぬエラーが発生しました',
        ) as SnackBar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Center(
          child: SizedBox(
            width: 300,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const Text(
                  'アカウント作成',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'メールアドレス',
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 50,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 50),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'パスワード',
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 50,
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordVisible,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          !passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: 10),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: _signup,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'さあ、始めよう！',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => context.goNamed(LoginPage.routeName),
                  child: const Text(
                    '-ログインに戻る-',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
