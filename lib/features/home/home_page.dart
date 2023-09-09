import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/flavors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
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
                context.goNamed(MyPage.routeName);
              },
              child: const Text('Go MyPage'),
            ),
          ],
        ),
      ),
    );
  }
}
