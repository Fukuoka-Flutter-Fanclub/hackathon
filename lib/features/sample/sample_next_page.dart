import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/home/home_page.dart';

class SampleNextPage extends StatelessWidget {
  const SampleNextPage({super.key});

  static const routeName = 'next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Next'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(HomePage.routeName);
          },
          child: const Text('Go Home'),
        ),
      ),
    );
  }
}
