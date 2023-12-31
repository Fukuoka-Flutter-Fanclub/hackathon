import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/component/snack_bar.dart';
import 'package:hackathon/features/auth/data/supabase_auth_repository.dart';
import 'package:hackathon/features/auth/view/password_reset_page.dart';
import 'package:hackathon/features/auth/view/sign_in_page.dart';
import 'package:hackathon/features/home/home_page.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  static const routeName = 'login';

  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  Future<void> _logIn() async {
    final authRepository = ref.read(authRepositoryProvider);

    if (!authRepository.isEmailValid(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: Text('email error \n 有効なメールアドレスを入力してください'),
        ),
      );
      return;
    } else if (!authRepository.isPasswordValid(passwordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: Text('password error \n パスワードが短すぎます！'),
        ),
      );
      return;
    }
    final statusCode = await authRepository.logInByEmail(
      email: emailController.text,
      password: passwordController.text,
    );
    if (!mounted) {
      return;
    }

    if (statusCode == '200') {
      context.go(HomePage.routeName);
      return;
    } else if (statusCode == '400') {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: Text('認証エラー \n メールから認証を済ませてください'),
        ),
      );
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: Text('認証エラー \n メールから認証を済ませてください'),
        ),
      );
      return;
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Flutter Hackathon',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'メールアドレス',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                      style: const TextStyle(color: Colors.white, fontSize: 20),
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
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                      obscureText: obscureText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
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
                  TextButton(
                    onPressed: () =>
                        context.goNamed(PasswordResetPage.routeName),
                    child: const Text(
                      'パスワード忘れちゃった？',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
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
                    onPressed: _logIn,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'LOGIN',
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
                    onPressed: () => context.goNamed(SignInPage.routeName),
                    child: const Text(
                      '-アカウント作成はこちら-',
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
      ),
    );
  }
}
