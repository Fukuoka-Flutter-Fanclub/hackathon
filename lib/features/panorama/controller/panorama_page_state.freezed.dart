// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'panorama_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PanoramaPageState {
  double get topPosition => throw _privateConstructorUsedError;
  double get leftPosition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PanoramaPageStateCopyWith<PanoramaPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanoramaPageStateCopyWith<$Res> {
  factory $PanoramaPageStateCopyWith(
          PanoramaPageState value, $Res Function(PanoramaPageState) then) =
      _$PanoramaPageStateCopyWithImpl<$Res, PanoramaPageState>;
  @useResult
  $Res call({double topPosition, double leftPosition});
}

/// @nodoc
class _$PanoramaPageStateCopyWithImpl<$Res, $Val extends PanoramaPageState>
    implements $PanoramaPageStateCopyWith<$Res> {
  _$PanoramaPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topPosition = null,
    Object? leftPosition = null,
  }) {
    return _then(_value.copyWith(
      topPosition: null == topPosition
          ? _value.topPosition
          : topPosition // ignore: cast_nullable_to_non_nullable
              as double,
      leftPosition: null == leftPosition
          ? _value.leftPosition
          : leftPosition // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PanoramaPageStateCopyWith<$Res>
    implements $PanoramaPageStateCopyWith<$Res> {
  factory _$$_PanoramaPageStateCopyWith(_$_PanoramaPageState value,
          $Res Function(_$_PanoramaPageState) then) =
      __$$_PanoramaPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double topPosition, double leftPosition});
}

/// @nodoc
class __$$_PanoramaPageStateCopyWithImpl<$Res>
    extends _$PanoramaPageStateCopyWithImpl<$Res, _$_PanoramaPageState>
    implements _$$_PanoramaPageStateCopyWith<$Res> {
  __$$_PanoramaPageStateCopyWithImpl(
      _$_PanoramaPageState _value, $Res Function(_$_PanoramaPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topPosition = null,
    Object? leftPosition = null,
  }) {
    return _then(_$_PanoramaPageState(
      topPosition: null == topPosition
          ? _value.topPosition
          : topPosition // ignore: cast_nullable_to_non_nullable
              as double,
      leftPosition: null == leftPosition
          ? _value.leftPosition
          : leftPosition // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PanoramaPageState implements _PanoramaPageState {
  const _$_PanoramaPageState({this.topPosition = 0.0, this.leftPosition = 0.0});

  @override
  @JsonKey()
  final double topPosition;
  @override
  @JsonKey()
  final double leftPosition;

  @override
  String toString() {
    return 'PanoramaPageState(topPosition: $topPosition, leftPosition: $leftPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PanoramaPageState &&
            (identical(other.topPosition, topPosition) ||
                other.topPosition == topPosition) &&
            (identical(other.leftPosition, leftPosition) ||
                other.leftPosition == leftPosition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topPosition, leftPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PanoramaPageStateCopyWith<_$_PanoramaPageState> get copyWith =>
      __$$_PanoramaPageStateCopyWithImpl<_$_PanoramaPageState>(
          this, _$identity);
}

abstract class _PanoramaPageState implements PanoramaPageState {
  const factory _PanoramaPageState(
      {final double topPosition,
      final double leftPosition}) = _$_PanoramaPageState;

  @override
  double get topPosition;
  @override
  double get leftPosition;
  @override
  @JsonKey(ignore: true)
  _$$_PanoramaPageStateCopyWith<_$_PanoramaPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
