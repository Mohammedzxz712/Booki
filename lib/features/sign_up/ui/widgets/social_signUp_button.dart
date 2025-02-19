import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class SocialSignUpButtons extends StatelessWidget {
  const SocialSignUpButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.apple,
            size: 32, color: Colors.black),
        horizontalSpace(15),
        Icon(Icons.facebook,
            size: 30, color: Colors.blue[800]),
        horizontalSpace(16),
        Image.asset('assets/images/google.png',
            width: 22, height: 22)
      ],
    );
  }
}