import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/panorama/controller/panorama_page_state.dart';
import 'package:sensors_plus/sensors_plus.dart';

final panoramaPageStateProvider = StateNotifierProvider.autoDispose<
    PanoramaPageStateNotifier, PanoramaPageState>(
  (read) => PanoramaPageStateNotifier(ref: read),
);

class PanoramaPageStateNotifier extends StateNotifier<PanoramaPageState> {
  PanoramaPageStateNotifier({required this.ref})
      : super(const PanoramaPageState());

  final Ref ref;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<CompassEvent>? _compassSubscription;

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    _compassSubscription?.cancel();
    super.dispose();
  }

  Future<void> setPosition() async {
    final imageSize = await getImageSize();
    await _accelerometerSubscription?.cancel();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      final height = imageSize.height;
      final def = height / 20;
      state = state.copyWith(topPosition: -(height + def * (event.z - 10)));
    });
    final width = imageSize.width;
    final defWidth = width / 360;
    await _compassSubscription?.cancel();
    _compassSubscription = FlutterCompass.events?.listen((event) {
      state = state.copyWith(
          leftPosition: -(width + defWidth * (event.heading ?? 0)));
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
}
