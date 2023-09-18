import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  const CustomSnackBar({
    super.key,
    super.backgroundColor = Colors.grey,
    required super.content,
    super.duration = const Duration(seconds: 3),
    super.elevation = 0,
  });
}
