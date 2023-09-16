import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_page_state.freezed.dart';

@freezed
class SignupPageState with _$SignupPageState {
  const factory SignupPageState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController userNameController,
    @Default(false) bool passwordVisible,
  }) = _SignupPageState;
}
