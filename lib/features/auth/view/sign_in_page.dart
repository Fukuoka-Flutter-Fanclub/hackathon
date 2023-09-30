import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/auth/data/auth_repository.dart';
import 'package:hackathon/features/auth/view/components/google_sign_in_button.dart';
import 'package:hackathon/features/home/home_page.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const routeName = 'sign_in';

  @override
  ConsumerState<SignInPage> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleSignInButton(
          onPressed: () async {
            await ref.read(authProvider).signInWithGoogle();
            if (!mounted) {
              return;
            }
            context.goNamed(HomePage.routeName);
          },
        ),
      ),
    );
  }
}
