import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_state.freezed.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController userNameController,
    @Default(false) bool passwordVisible,
  }) = _LoginPageState;
}
