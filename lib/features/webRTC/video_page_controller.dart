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

  @override
  void dispose() async {
    await engine.release();
    await engine.leaveChannel();
    super.dispose();
  }

  Future<void> initAgoraRtcEngine(String channelName) async {
    await engine.initialize(const RtcEngineContext(appId: 'YOUR_APP_ID'));
    await engine.setVideoEncoderConfiguration(configuration);
    await engine.joinChannel(
      token: '',
      channelId: channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
    await engine.enableVideo();
    await engine.startPreview();
    await engine.enableDualStreamMode(enabled: true);

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onError: (err, msg) => print('onError $err $msg'),
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print('joinChannelSuccess ');
        },
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          state = state.copyWith(uidList: {...state.uidList, uid});
        },
        onUserOffline:
            (RtcConnection connection, int uid, UserOfflineReasonType reason) {
          state = state.copyWith(
            uidList: state.uidList.where((element) => element != uid).toSet(),
          );
        },
        onLeaveChannel: (connection, stats) => {dispose()},
      ),
    );
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
