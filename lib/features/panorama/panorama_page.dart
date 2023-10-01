import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/features/home/home_page.dart';
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

    Future.delayed(const Duration(seconds: 4), () {
      ref.read(panoramaPageStateProvider.notifier).changeloading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(panoramaPageStateProvider);
    if (state.loading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              Text(
                '位置情報・景色情報を取得中...',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'スマートフォンを水平に持ってください',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Panorama(
              longitude: state.longitude,
              animSpeed: 0.01,
              sensorControl: SensorControl.Orientation,
              child: Image.asset('assets/images/panorama_sample.jpg'),
              hotspots: [
                Hotspot(
                    latitude: 70.0,
                    longitude: -90.0,
                    width: 0.05,
                    height: 0.05,
                    widget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_pin,
                      ),
                      color: Colors.red,
                    )),
              ]),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              iconSize: 40.0,
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                context.goNamed(HomePage.routeName);
              },
              icon: const Icon(Icons.cancel),
            ),
          ),
        ],
      ),
    );
  }
}
