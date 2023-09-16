// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupPageState {
//NullSafetyのためデフォルト値の指定が必須
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;
  TextEditingController get userNameController =>
      throw _privateConstructorUsedError;
  bool get passwordVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupPageStateCopyWith<SignupPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupPageStateCopyWith<$Res> {
  factory $SignupPageStateCopyWith(
          SignupPageState value, $Res Function(SignupPageState) then) =
      _$SignupPageStateCopyWithImpl<$Res, SignupPageState>;
  @useResult
  $Res call(
      {TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController userNameController,
      bool passwordVisible});
}

/// @nodoc
class _$SignupPageStateCopyWithImpl<$Res, $Val extends SignupPageState>
    implements $SignupPageStateCopyWith<$Res> {
  _$SignupPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailController = null,
    Object? passwordController = null,
    Object? userNameController = null,
    Object? passwordVisible = null,
  }) {
    return _then(_value.copyWith(
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: null == passwordController
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      userNameController: null == userNameController
          ? _value.userNameController
          : userNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordVisible: null == passwordVisible
          ? _value.passwordVisible
          : passwordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupPageStateCopyWith<$Res>
    implements $SignupPageStateCopyWith<$Res> {
  factory _$$_SignupPageStateCopyWith(
          _$_SignupPageState value, $Res Function(_$_SignupPageState) then) =
      __$$_SignupPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController userNameController,
      bool passwordVisible});
}

/// @nodoc
class __$$_SignupPageStateCopyWithImpl<$Res>
    extends _$SignupPageStateCopyWithImpl<$Res, _$_SignupPageState>
    implements _$$_SignupPageStateCopyWith<$Res> {
  __$$_SignupPageStateCopyWithImpl(
      _$_SignupPageState _value, $Res Function(_$_SignupPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailController = null,
    Object? passwordController = null,
    Object? userNameController = null,
    Object? passwordVisible = null,
  }) {
    return _then(_$_SignupPageState(
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: null == passwordController
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      userNameController: null == userNameController
          ? _value.userNameController
          : userNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordVisible: null == passwordVisible
          ? _value.passwordVisible
          : passwordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignupPageState implements _SignupPageState {
  const _$_SignupPageState(
      {required this.emailController,
      required this.passwordController,
      required this.userNameController,
      this.passwordVisible = false});

//NullSafetyのためデフォルト値の指定が必須
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController passwordController;
  @override
  final TextEditingController userNameController;
  @override
  @JsonKey()
  final bool passwordVisible;

  @override
  String toString() {
    return 'SignupPageState(emailController: $emailController, passwordController: $passwordController, userNameController: $userNameController, passwordVisible: $passwordVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupPageState &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.userNameController, userNameController) ||
                other.userNameController == userNameController) &&
            (identical(other.passwordVisible, passwordVisible) ||
                other.passwordVisible == passwordVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailController,
      passwordController, userNameController, passwordVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupPageStateCopyWith<_$_SignupPageState> get copyWith =>
      __$$_SignupPageStateCopyWithImpl<_$_SignupPageState>(this, _$identity);
}

abstract class _SignupPageState implements SignupPageState {
  const factory _SignupPageState(
      {required final TextEditingController emailController,
      required final TextEditingController passwordController,
      required final TextEditingController userNameController,
      final bool passwordVisible}) = _$_SignupPageState;

  @override //NullSafetyのためデフォルト値の指定が必須
  TextEditingController get emailController;
  @override
  TextEditingController get passwordController;
  @override
  TextEditingController get userNameController;
  @override
  bool get passwordVisible;
  @override
  @JsonKey(ignore: true)
  _$$_SignupPageStateCopyWith<_$_SignupPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
