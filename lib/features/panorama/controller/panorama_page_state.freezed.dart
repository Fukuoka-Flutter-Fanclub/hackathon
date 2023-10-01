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
  double get longitude => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

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
  $Res call({double longitude, bool loading});
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
    Object? longitude = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PanoramaPageStateImplCopyWith<$Res>
    implements $PanoramaPageStateCopyWith<$Res> {
  factory _$$PanoramaPageStateImplCopyWith(_$PanoramaPageStateImpl value,
          $Res Function(_$PanoramaPageStateImpl) then) =
      __$$PanoramaPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double longitude, bool loading});
}

/// @nodoc
class __$$PanoramaPageStateImplCopyWithImpl<$Res>
    extends _$PanoramaPageStateCopyWithImpl<$Res, _$PanoramaPageStateImpl>
    implements _$$PanoramaPageStateImplCopyWith<$Res> {
  __$$PanoramaPageStateImplCopyWithImpl(_$PanoramaPageStateImpl _value,
      $Res Function(_$PanoramaPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? loading = null,
  }) {
    return _then(_$PanoramaPageStateImpl(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PanoramaPageStateImpl implements _PanoramaPageState {
  const _$PanoramaPageStateImpl({this.longitude = 0.0, this.loading = true});

  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'PanoramaPageState(longitude: $longitude, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanoramaPageStateImpl &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, longitude, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PanoramaPageStateImplCopyWith<_$PanoramaPageStateImpl> get copyWith =>
      __$$PanoramaPageStateImplCopyWithImpl<_$PanoramaPageStateImpl>(
          this, _$identity);
}

abstract class _PanoramaPageState implements PanoramaPageState {
  const factory _PanoramaPageState(
      {final double longitude, final bool loading}) = _$PanoramaPageStateImpl;

  @override
  double get longitude;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$PanoramaPageStateImplCopyWith<_$PanoramaPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
