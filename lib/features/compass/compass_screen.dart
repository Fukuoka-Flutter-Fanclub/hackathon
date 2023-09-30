import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/core/hoge/compass_provider.dart';
import 'package:hackathon/features/compass/controller/compass_controller.dart';

class CompassScreen extends ConsumerStatefulWidget {
  const CompassScreen({super.key});

  static const routeName = 'compass';

  @override
  ConsumerState<CompassScreen> createState() => CompassScreenState();
}

class CompassScreenState extends ConsumerState<CompassScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(compassStateProvider.notifier).getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final compassState = ref.watch(compassStateProvider);
    final latitude = compassState.latitude;
    final longitude = compassState.longitude;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Surroundings App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('現在の位置: $latitude, $longitude'),
            ref.watch(compassProvider).maybeWhen(
                  data: (events) => Text('方位: ${events?.heading}'),
                  orElse: () => const Text('ないよー'),
                ),
          ],
        ),
      ),
    );
  }
}
