import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/login/login_page_view_model.dart';
import 'package:hackathon/features/password_reset/password_reset_page.dart';
import 'package:hackathon/features/signup/signup_page.dart';
import 'package:hackathon/features/snack_bar.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool isPasswordObscure = true;

  @override
  void dispose() {
    super.dispose();
    ref.read(authTextEditingControllers).dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllers = ref.watch(authTextEditingControllers);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400),
          child: Center(
            child: ListView(
              shrinkWrap: true,
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
                    controller: controllers.email,
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
                    controller: controllers.password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPasswordObscure,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {},
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
                  onPressed: () => context.go(PasswordResetPage.routeName),
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
                  onPressed: () async {
                    if (!controllers.isEmailValid) {
                      showCustomSnackBar(
                        ['メールアドレス入力エラー', '有効なメールアドレスを入力してください'],
                        context,
                      );
                    } else {
                      final result = await ref.read(epLoginController).emailSignIn(
                            email: controllers.email.text,
                            password: controllers.password.text,
                          );
                      if (result && context.mounted) {
                        context.goNamed(HomePage.routeName);
                      }
                    }
                  },
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
                  onPressed: () {
                    context.go(SignupPage.routeName);
                  },
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
    );
  }
}
