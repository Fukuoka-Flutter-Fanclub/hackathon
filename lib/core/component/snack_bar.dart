import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    required this.content,
    this.color = Colors.grey,
    super.key,
  });
  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd,
      content: Text(content),
    );
  }
}
