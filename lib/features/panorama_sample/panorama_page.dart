import 'package:flutter/material.dart';

class PanoramaPage extends StatefulWidget {
  const PanoramaPage({super.key});

  static const routeName = 'panorama';

  @override
  State<PanoramaPage> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends State<PanoramaPage> {
  static const imageWidth = 778.0;
  static const imageHeight = 389.0;

  double topPosition = 0;
  double leftPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Photo'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: topPosition,
            left: leftPosition,
            child: GestureDetector(
              onPanUpdate: (details) {
                leftPosition += details.delta.dx;
                if (leftPosition < -imageWidth) {
                  leftPosition += imageWidth;
                }
                if (leftPosition > 0) {
                  leftPosition -= imageWidth;
                }
                print(leftPosition);
                setState(() {
                  topPosition += details.delta.dy;
                });
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/sample.jpeg',
                  ),
                  Image.asset(
                    'assets/images/sample.jpeg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
