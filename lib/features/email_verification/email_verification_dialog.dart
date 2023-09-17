import 'package:flutter/material.dart';

class EmailVerificationDialog extends StatelessWidget {
  const EmailVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Center(
          child: Column(
            children: [
              Text(
                'メールをご確認してください',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
