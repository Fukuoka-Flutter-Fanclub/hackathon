import 'dart:async';

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
    _compassSubscription = FlutterCompass.events?.listen((event) {
      state = state.copyWith(
        longitude: event.heading!,
      );
    });
  }

  void changeloading(bool loading) {
    state = state.copyWith(loading: loading);
  }
}
