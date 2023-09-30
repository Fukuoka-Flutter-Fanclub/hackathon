import 'package:flutter/foundation.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'compass_controller.freezed.dart';

@freezed
class CompassState with _$CompassState {
  const factory CompassState({
    @Default(0.0) double direction,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
  }) = _CompassState;
}

final compassStateProvider = StateNotifierProvider.autoDispose<CompassStateNotifier, CompassState>(
  (read) => CompassStateNotifier(ref: read),
);

class CompassStateNotifier extends StateNotifier<CompassState> {
  CompassStateNotifier({required this.ref}) : super(const CompassState());

  final Ref ref;

  Future<void> getLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    state = state.copyWith(latitude: position.latitude);
    state = state.copyWith(longitude: position.longitude);
  }

  Future<void> getDirection() async {
    if (FlutterCompass.events != null) {
      FlutterCompass.events!.listen((event) {
        if (event.heading != null) {
          state = state.copyWith(direction: event.heading!);
        }
      });
    }
  }

}
