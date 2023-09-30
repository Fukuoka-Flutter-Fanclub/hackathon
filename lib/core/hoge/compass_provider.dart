import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compassProvider = StreamProvider.autoDispose(
  (ref) => FlutterCompass.events ?? Stream.value(null),
);
