import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/auth/data/auth_repository.dart';
import 'package:hackathon/features/auth/view/components/google_sign_in_button.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  static const routeName = 'sign_in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: GoogleSignInButton(
          onPressed: () => ref.read(authProvider).signInWithGoogle(),
        ),
      ),
    );
  }
}
