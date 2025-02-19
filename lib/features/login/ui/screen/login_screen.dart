import 'package:bookly/core/helpers/exetinsions.dart';
import 'package:bookly/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_bottom.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/forget_pass.dart';
import '../widgets/social_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.offWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents the Column from expanding
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(44),
                const EmailAndPassword(),
                const ForgetPassword(),
                verticalSpace(16),
                AppTextButton(
                  buttonText: "Login",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    context.pushReplacementNamed(Routes.layout);
                  },
                ),
                verticalSpace(27),
                const Text('Or Login With'),
                verticalSpace(11),
                const SocialLoginButtons(),
                verticalSpace(36),
                const AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
