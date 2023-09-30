import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class PanoramaPage extends ConsumerStatefulWidget {
  const PanoramaPage({super.key});

  static const routeName = 'panorama_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends ConsumerState<PanoramaPage> {
  double topPosition = 0;
  double leftPosition = 0;
  late final Image image;
  Size imageSize = const Size(0, 0);
  @override
  void initState() {
    super.initState();

    Future(() async {
      imageSize = await getImageSize();
      setState(() {
        print('object');
      });

      accelerometerEvents.listen((AccelerometerEvent event) {
        final height = imageSize.height - MediaQuery.of(context).size.height;
        final width = imageSize.width;

        final def = height / 20;
        setState(() {
          topPosition = -(height + def * (event.z - 10));
          // leftPosition = -(widget + def * (event.z - 10));
          //  print(topPosition);
        });

        //  print(topPosition);

        //print(event);
      });
    });
  }

  Future<Size> getImageSize() async {
    final image = Image.asset('assets/images/panorama_sample.jpg');
    final completer = Completer<Size>();
    image.image.resolve(ImageConfiguration.empty).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          final myImage = image.image;
          final size =
              Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Photo"),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: topPosition,
            left: leftPosition,
            child: Image.asset(
              'assets/images/panorama_sample.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
