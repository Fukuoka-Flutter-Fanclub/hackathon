import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroPage extends ConsumerStatefulWidget {
  const GyroPage({super.key});

  static const routeName = 'gyro';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return GyroPageState();
  }
}

class GyroPageState extends ConsumerState<GyroPage> {
  String _gyroscopeValues = '';

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          _gyroscopeValues = 'ジャイロセンサーのX軸方向\n${event.x}';
        } else {
          _gyroscopeValues = 'ジャイロセンサーのY軸方向\n${event.y}';
        }
      });
    });
  }

  @override
  void dispose() {
    gyroscopeEvents.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyro Page'),
      ),
      body: Center(
        child: Text(_gyroscopeValues),
      ),
    );
  }
}
