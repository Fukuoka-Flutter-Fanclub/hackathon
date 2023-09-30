import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compassProvider = StreamProvider((ref) async* {
  final events = FlutterCompass.events;
  if (events == null) {
    yield null;
  }
  final last = await events?.last;
  yield last;
});
