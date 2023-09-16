import 'package:flutter/material.dart';

void showCustomSnackBar(
  List<String> texts,
  BuildContext context, {
  Color? color,
}) {
  final textList = <Widget>[];
  for (final text in texts) {
    textList.add(
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
  final snackBar = SnackBar(
    backgroundColor: Colors.grey[600],
    duration: const Duration(seconds: 2),
    dismissDirection: DismissDirection.startToEnd,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textList,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
