// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordResetPageState {
//NullSafetyのためデフォルト値の指定が必須
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordResetPageStateCopyWith<PasswordResetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetPageStateCopyWith<$Res> {
  factory $PasswordResetPageStateCopyWith(PasswordResetPageState value,
          $Res Function(PasswordResetPageState) then) =
      _$PasswordResetPageStateCopyWithImpl<$Res, PasswordResetPageState>;
  @useResult
  $Res call({TextEditingController emailController, bool isLoading});
}

/// @nodoc
class _$PasswordResetPageStateCopyWithImpl<$Res,
        $Val extends PasswordResetPageState>
    implements $PasswordResetPageStateCopyWith<$Res> {
  _$PasswordResetPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailController = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordResetPageStateCopyWith<$Res>
    implements $PasswordResetPageStateCopyWith<$Res> {
  factory _$$_PasswordResetPageStateCopyWith(_$_PasswordResetPageState value,
          $Res Function(_$_PasswordResetPageState) then) =
      __$$_PasswordResetPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextEditingController emailController, bool isLoading});
}

/// @nodoc
class __$$_PasswordResetPageStateCopyWithImpl<$Res>
    extends _$PasswordResetPageStateCopyWithImpl<$Res,
        _$_PasswordResetPageState>
    implements _$$_PasswordResetPageStateCopyWith<$Res> {
  __$$_PasswordResetPageStateCopyWithImpl(_$_PasswordResetPageState _value,
      $Res Function(_$_PasswordResetPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailController = null,
    Object? isLoading = null,
  }) {
    return _then(_$_PasswordResetPageState(
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PasswordResetPageState implements _PasswordResetPageState {
  const _$_PasswordResetPageState(
      {required this.emailController, this.isLoading = false});

//NullSafetyのためデフォルト値の指定が必須
  @override
  final TextEditingController emailController;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PasswordResetPageState(emailController: $emailController, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordResetPageState &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailController, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordResetPageStateCopyWith<_$_PasswordResetPageState> get copyWith =>
      __$$_PasswordResetPageStateCopyWithImpl<_$_PasswordResetPageState>(
          this, _$identity);
}

abstract class _PasswordResetPageState implements PasswordResetPageState {
  const factory _PasswordResetPageState(
      {required final TextEditingController emailController,
      final bool isLoading}) = _$_PasswordResetPageState;

  @override //NullSafetyのためデフォルト値の指定が必須
  TextEditingController get emailController;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordResetPageStateCopyWith<_$_PasswordResetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
