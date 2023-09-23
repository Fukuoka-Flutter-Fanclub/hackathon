import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/webRTC/video_page_controller.dart';

class VideoPage extends ConsumerStatefulWidget {
  const VideoPage({super.key});
  static const routeName = 'video';

  @override
  ConsumerState<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends ConsumerState<VideoPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(videoPageViewModelProvider.notifier).initAgoraRtcEngine();
    });
    super.initState();
  }

  Widget _localPreview() {
    final engine = ref.watch(rtcEnginProvider);
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: engine,
        canvas: VideoCanvas(),
      ),
    );
  }

  Widget _remoteVideo() {
    final engine = ref.watch(rtcEnginProvider);
    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: engine,
        canvas: VideoCanvas(),
        connection: RtcConnection(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(videoPageViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get started with Video Calling'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        children: [
          // Container for the local video
          Container(
            height: 240,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(child: _localPreview()),
          ),
          const SizedBox(height: 10),
          //Container for the Remote video
          Container(
            height: 240,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(child: _remoteVideo()),
          ),
        ],
      ),
    );
  }
}
