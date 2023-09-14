import 'package:flutter/material.dart';
import 'package:hackathon/core/extensions/build_context_x.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/my_page/my_page.dart';
import 'package:hackathon/features/sign_in/supabase_auth_service.dart';
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
                context.goNamedWithArg(
                  MyPage.routeName,
                  arg: const MyPageArg(id: 'id'),
                );
              },
              child: const Text('Go MyPage'),
            ),
          ],
        ),
      ),
    );
  }
}
