import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/panorama/controller/panorama_page_controller.dart';
import 'package:panorama/panorama.dart';

class PanoramaPage extends ConsumerStatefulWidget {
  const PanoramaPage({super.key});

  static const routeName = 'panorama_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends ConsumerState<PanoramaPage> {
  @override
  void initState() {
    super.initState();
    ref.read(panoramaPageStateProvider.notifier).setPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Panorama(
          animSpeed: 0.01,
          sensorControl: SensorControl.Orientation,
          child: Image.asset('assets/images/panorama_sample.jpg'),
        ),
      ),
    );
  }
}
