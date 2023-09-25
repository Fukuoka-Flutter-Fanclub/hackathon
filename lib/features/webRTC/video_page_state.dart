import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_page_state.freezed.dart';

@freezed
class VideoPageState with _$VideoPageState {
  const factory VideoPageState({
    @Default({}) Set<int> uidList,
    @Default(false) bool isMute,
    @Default(false) bool isCameraOff,
  }) = _VideoPageState;
}
