// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoPageState {
  Set<int> get uidList => throw _privateConstructorUsedError;
  bool get isMute => throw _privateConstructorUsedError;
  bool get isCameraOff => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoPageStateCopyWith<VideoPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPageStateCopyWith<$Res> {
  factory $VideoPageStateCopyWith(
          VideoPageState value, $Res Function(VideoPageState) then) =
      _$VideoPageStateCopyWithImpl<$Res, VideoPageState>;
  @useResult
  $Res call({Set<int> uidList, bool isMute, bool isCameraOff});
}

/// @nodoc
class _$VideoPageStateCopyWithImpl<$Res, $Val extends VideoPageState>
    implements $VideoPageStateCopyWith<$Res> {
  _$VideoPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uidList = null,
    Object? isMute = null,
    Object? isCameraOff = null,
  }) {
    return _then(_value.copyWith(
      uidList: null == uidList
          ? _value.uidList
          : uidList // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      isMute: null == isMute
          ? _value.isMute
          : isMute // ignore: cast_nullable_to_non_nullable
              as bool,
      isCameraOff: null == isCameraOff
          ? _value.isCameraOff
          : isCameraOff // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoPageStateCopyWith<$Res>
    implements $VideoPageStateCopyWith<$Res> {
  factory _$$_VideoPageStateCopyWith(
          _$_VideoPageState value, $Res Function(_$_VideoPageState) then) =
      __$$_VideoPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<int> uidList, bool isMute, bool isCameraOff});
}

/// @nodoc
class __$$_VideoPageStateCopyWithImpl<$Res>
    extends _$VideoPageStateCopyWithImpl<$Res, _$_VideoPageState>
    implements _$$_VideoPageStateCopyWith<$Res> {
  __$$_VideoPageStateCopyWithImpl(
      _$_VideoPageState _value, $Res Function(_$_VideoPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uidList = null,
    Object? isMute = null,
    Object? isCameraOff = null,
  }) {
    return _then(_$_VideoPageState(
      uidList: null == uidList
          ? _value._uidList
          : uidList // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      isMute: null == isMute
          ? _value.isMute
          : isMute // ignore: cast_nullable_to_non_nullable
              as bool,
      isCameraOff: null == isCameraOff
          ? _value.isCameraOff
          : isCameraOff // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_VideoPageState implements _VideoPageState {
  const _$_VideoPageState(
      {final Set<int> uidList = const {},
      this.isMute = false,
      this.isCameraOff = false})
      : _uidList = uidList;

  final Set<int> _uidList;
  @override
  @JsonKey()
  Set<int> get uidList {
    if (_uidList is EqualUnmodifiableSetView) return _uidList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_uidList);
  }

  @override
  @JsonKey()
  final bool isMute;
  @override
  @JsonKey()
  final bool isCameraOff;

  @override
  String toString() {
    return 'VideoPageState(uidList: $uidList, isMute: $isMute, isCameraOff: $isCameraOff)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoPageState &&
            const DeepCollectionEquality().equals(other._uidList, _uidList) &&
            (identical(other.isMute, isMute) || other.isMute == isMute) &&
            (identical(other.isCameraOff, isCameraOff) ||
                other.isCameraOff == isCameraOff));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_uidList), isMute, isCameraOff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoPageStateCopyWith<_$_VideoPageState> get copyWith =>
      __$$_VideoPageStateCopyWithImpl<_$_VideoPageState>(this, _$identity);
}

abstract class _VideoPageState implements VideoPageState {
  const factory _VideoPageState(
      {final Set<int> uidList,
      final bool isMute,
      final bool isCameraOff}) = _$_VideoPageState;

  @override
  Set<int> get uidList;
  @override
  bool get isMute;
  @override
  bool get isCameraOff;
  @override
  @JsonKey(ignore: true)
  _$$_VideoPageStateCopyWith<_$_VideoPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
