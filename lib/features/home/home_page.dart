import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/extensions/build_context_x.dart';
import 'package:hackathon/features/auth/data/auth_repository.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/time_line/time_line_screen.dart';
import 'package:hackathon/flavors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
        actions: [
          TextButton(
            onPressed: () {
              context.goNamed(TimeLineScreen.routeName);
            },
            child: const Text(
              'TimeLine',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
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
                ref.read(authProvider).signInWithGoogle();
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
