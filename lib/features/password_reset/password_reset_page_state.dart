import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_page_state.freezed.dart';

@freezed
class PasswordResetPageState with _$PasswordResetPageState {
  const factory PasswordResetPageState({
    required TextEditingController emailController,
    @Default(false) bool isLoading,
  }) = _PasswordResetPageState;
}
