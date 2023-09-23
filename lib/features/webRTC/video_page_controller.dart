import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/features/webRTC/video_page_state.dart';

final rtcEnginProvider = Provider<RtcEngine>((ref) {
  final engine = createAgoraRtcEngine();

  return engine;
});

final videoPageViewModelProvider =
    StateNotifierProvider<VideoPageNotifier, VideoPageState>(
        (_ref) => VideoPageNotifier(_ref));

class VideoPageNotifier extends StateNotifier<VideoPageState> {
  VideoPageNotifier(this._ref) : super(const VideoPageState());
  final Ref _ref;

  RtcEngine get engine => _ref.read(rtcEnginProvider);

  VideoEncoderConfiguration get configuration =>
      const VideoEncoderConfiguration(
        dimensions: VideoDimensions(width: 1920, height: 1080),
      );

  Future<void> initAgoraRtcEngine() async {
    await engine.initialize(const RtcEngineContext(appId: 'YOUR_APP_ID'));
    await engine.setVideoEncoderConfiguration(configuration);
    await engine.joinChannel(
      token: '',
      channelId: 'channelName',
      uid: 0,
      options: const ChannelMediaOptions(),
    );
    await engine.enableVideo();
    await engine.startPreview();
    await engine.enableDualStreamMode(enabled: true);

    engine.registerEventHandler(RtcEngineEventHandler(
      onError: (err, msg) => print('onError $err $msg'),
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        print('joinChannelSuccess ');
      },
      onUserJoined: (RtcConnection connection, int uid, int elapsed) {
        print('userJoined $uid $elapsed');
      },
      onUserOffline:
          (RtcConnection connection, int uid, UserOfflineReasonType reason) {
        print('userOffline $uid $reason');
      },
      onLeaveChannel: (connection, stats) => print('leaveChannel '),
    ));
  }

  Future<void> micMute() async {
    state = state.copyWith(
      isMute: !state.isMute,
    );
    await engine.muteLocalAudioStream(state.isMute);
  }

  Future<void> cameraOff() async {
    state = state.copyWith(
      isCameraOff: !state.isCameraOff,
    );
    await engine.muteLocalVideoStream(state.isCameraOff);
  }
}
