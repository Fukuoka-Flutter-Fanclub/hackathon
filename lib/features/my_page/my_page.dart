import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/route_argument.dart';
import 'package:hackathon/features/home/home_page.dart';
import 'package:hackathon/features/sample/sample_page.dart';

class MyPage extends StatelessWidget {
  const MyPage(this.argument, {super.key});

  final MyPageArg argument;

  static const routeName = 'my_page';

  static MyPageArg arg({required String id}) => MyPageArg(id: id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page ID: ${argument.id}'),
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

class MyPageArg implements RouteArgument {
  const MyPageArg({required this.id});

  final String id;
}
