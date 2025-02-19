import 'package:bookly/core/helpers/exetinsions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_bottom.dart';

class SignAndLoginButton extends StatelessWidget {
  const SignAndLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          AppTextButton(
              buttonText: 'Great New Account',
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              onPressed: () {
                context.pushReplacementNamed(Routes.signUp);
              }),
          verticalSpace(20),
          AppTextButton(
            buttonText: 'Login',
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            onPressed: () {
              context.pushReplacementNamed(Routes.login);
            },
            border: const BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}