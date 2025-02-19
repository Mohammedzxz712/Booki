import 'package:bookly/features/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class UpdateProfileForm extends StatelessWidget {
   UpdateProfileForm({super.key});



  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;


  late TextEditingController passwordController;




  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          AppTextFormField(
            hintText: 'Mohammed Abdullah',
            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<ProfileCubit>().nameController,
          ),
          verticalSpace(18),

          AppTextFormField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
            prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
            hintText: 'xxxxx@gmail.com',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<ProfileCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),

            controller: context.read<ProfileCubit>().phoneController,
            hintText: '01553987674',
            prefixIcon: const Icon(Icons.phone_outlined, color: Colors.grey),
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
          ),

          verticalSpace(18),
          AppTextFormField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
            controller: context.read<ProfileCubit>().passwordController,
            hintText: 'xxxxxxxxxx',
            prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.grey),
            isObscureText: isPasswordObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),


            controller: context.read<ProfileCubit>().locationController,
            hintText: 'Egypt - Cairo',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Location';
              }
            },
          ),
          verticalSpace(24),

        ],
      ),
    );
  }
}