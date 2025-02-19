
import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.facebook, color: Colors.blue[800]),
        const SizedBox(width: 16),
        const Icon(Icons.apple, color: Colors.black),
        const SizedBox(width: 16),
        Image.asset('assets/images/google.png', width: 20, height: 20)
      ],
    );
  }
}