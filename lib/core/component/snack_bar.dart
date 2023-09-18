import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar._();
  static SnackBar createSnackBar({
    required String content,
    Color color = Colors.grey,
  }) {
    return SnackBar(
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd,
      content: Text(content),
    );
  }
}
