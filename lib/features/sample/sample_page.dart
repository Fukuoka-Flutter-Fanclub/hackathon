import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/sample/sample_next_page.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  static const routeName = 'sample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(SampleNextPage.routeName);
          },
          child: const Text('Go Next'),
        ),
      ),
    );
  }
}
