import 'package:bookly/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_bottom.dart';
import '../../logic/sign_up_cubit.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/social_signUp_button.dart';
import '../widgets/term_and_privasy.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.offWhite,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyles.font24BlackBold,
                    ),
                    verticalSpace(36),
                    Column(
                      children: [
                        const SignupForm(),
                        TermsAndPrivacyCheckbox(
                          isChecked:
                              context.read<SignUpCubit>().isChecked ?? false,
                          onChanged: (value) {
                            context
                                .read<SignUpCubit>()
                                .termsAndConditionsChecked(value);
                          },
                        ),
                        verticalSpace(20),
                        AppTextButton(
                          buttonText: "Sign Up",
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {},
                        ),
                        verticalSpace(16),
                        const Text(
                          'Or SignUp With'
                        ),
                        verticalSpace(11),
                        const SocialSignUpButtons(),
                        verticalSpace(20),
                        const AlreadyHaveAccount(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


