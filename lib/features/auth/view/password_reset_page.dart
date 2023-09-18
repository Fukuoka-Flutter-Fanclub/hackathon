import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/component/snack_bar.dart';
import 'package:hackathon/features/auth/auth_repository.dart';
import 'package:hackathon/features/auth/view/login_page.dart';

class PasswordResetPage extends ConsumerStatefulWidget {
  const PasswordResetPage({super.key});

  static String routeName = 'password_reset';

  @override
  ConsumerState<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends ConsumerState<PasswordResetPage> {
  final emailController = TextEditingController();

  Future<void> _sendEmail() async {
    final authRepository = ref.watch(authRepositoryProvider);

    if (!authRepository.isEmailValid(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.createSnackBar(
          content: 'email error \n 有効なメールアドレスを入力してください',
        ),
      );
      return;
    }
    final status = await authRepository.resetPassword(emailController.text);
    if (!mounted) {
      return;
    }
    if (status == '200') {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.createSnackBar(
          content: '送信完了\n メールをご確認ください',
        ),
      );
      context.goNamed(LoginPage.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.createSnackBar(
          content: 'error\n エラーが発生しました',
        ),
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
                  'パスワードをリセット',
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
                      contentPadding: EdgeInsets.only(top: 20),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: _sendEmail,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '送信',
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
