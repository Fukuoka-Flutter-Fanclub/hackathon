import 'package:freezed_annotation/freezed_annotation.dart';
part 'panorama_page_state.freezed.dart';

@freezed
class PanoramaPageState with _$PanoramaPageState {
  const factory PanoramaPageState({
    @Default(0.0) double topPosition,
    @Default(0.0) double leftPosition,
  }) = _PanoramaPageState;
}
