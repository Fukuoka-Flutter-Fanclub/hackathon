import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  static const routeName = 'my_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                context.goNamed(HomePage.routeName);
              },
              child: const Text('Go Home'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(SamplePage.routeName);
              },
              child: const Text('Go Sample Page'),
            ),
          ],
        ),
      ),
    );
  }
}
