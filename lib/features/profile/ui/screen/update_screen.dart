import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/core/widgets/app_text_bottom.dart';
import 'package:bookly/features/profile/ui/widgets/appbar_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';
import '../widgets/image_name_user.dart';
import '../widgets/update_profile_form.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.offWhite,
          appBar: const AppBarProfile(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                ImageNameAndUserName(profileCubit: profileCubit),
                verticalSpace(40),
                 UpdateProfileForm(),
                AppTextButton(buttonText:'Update' , textStyle: TextStyles.font16WhiteMedium, onPressed: () {

                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
