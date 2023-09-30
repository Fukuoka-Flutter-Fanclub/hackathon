import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  static const _width = 374;
  static const _height = 84;
  static const ratio = _width / _height;

  @override
  Widget build(BuildContext context) {
    const width = 200.0;
    const height = width / ratio;

    return InkWell(
      onTap: onPressed,
      child: Ink(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/btn_google_signin.png'),
          ),
        ),
      ),
    );
  }
}
