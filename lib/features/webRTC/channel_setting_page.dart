import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/core/component/snack_bar.dart';
import 'package:hackathon/features/webRTC/video_page.dart';
import 'package:permission_handler/permission_handler.dart';

class ChannelSttingPage extends ConsumerStatefulWidget {
  const ChannelSttingPage({super.key});
  static String routeName = 'channel_stting';

  @override
  ConsumerState<ChannelSttingPage> createState() => _ChannelSttingPageState();
}

class _ChannelSttingPageState extends ConsumerState<ChannelSttingPage> {
  final channalController = TextEditingController();

  Future<void> _logIn() async {
    final micRequest = Permission.microphone.request();
    final cameraRequest = Permission.camera.request();

    final micAvailable = await micRequest.isGranted;
    final cameraAvailable = await cameraRequest.isGranted;

    if (!mounted) {
      return;
    }

    if (micAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: Text('マイクの使用を許可してください'),
        ),
      );
      return;
    }
    if (!cameraAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const CustomSnackBar(
          content: Text('カメラの使用を許可してください'),
        ),
      );
      return;
    }
    context.goNamed(VideoPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Center(
          child: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'VideoRTC',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'channel name',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6CA8F1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    height: 50,
                    child: TextFormField(
                      controller: channalController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 50),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: _logIn,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
