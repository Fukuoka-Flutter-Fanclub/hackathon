import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/sign_in/auth_repository.dart';
import 'package:hackathon/flavors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello ${F.title}',
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authRepositoryProvider).signInByGoogle();
                // context.goNamedWithArg(
                //   MyPage.routeName,
                //   arg: const MyPageArg(id: 'id'),
                // );
              },
              child: const Text('Go MyPage'),
            ),
          ],
        ),
      ),
    );
  }
}
