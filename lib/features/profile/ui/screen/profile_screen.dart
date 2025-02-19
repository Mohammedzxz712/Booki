import 'package:bookly/core/helpers/exetinsions.dart';
import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/features/profile/ui/screen/update_screen.dart';
import 'package:bookly/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';
import '../widgets/appbar_profile.dart';
import '../widgets/image_name_user.dart';
import '../widgets/logout.dart';
import '../widgets/row_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarProfile(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                ImageNameAndUserName(profileCubit: profileCubit),
                verticalSpace(20),
                Text(
                  'ACCOUNT ',
                  style: TextStyles.font16Black,
                ),
                verticalSpace(15),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  height: 88.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.semiGray,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      RowProfile(
                        title: 'Profile Details',
                        prefixIcon:
                            const Icon(Icons.person, color: ColorsManager.gray),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => ProfileCubit(),
                                        child: const UpdateScreen(),
                                      )));
                        },
                      ),
                      verticalSpace(10),
                      RowProfile(
                        title: 'Privacy Policy',
                        prefixIcon: Image.asset(
                          Assets.imagesSheild,
                          width: 21.w,
                          height: 21.h,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),
                Text(
                  'Payment ',
                  style: TextStyles.font16Black,
                ),
                verticalSpace(15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  height: 44.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.semiGray,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: RowProfile(
                    title: 'Credit',
                    prefixIcon: const Icon(Icons.credit_card,
                        color: ColorsManager.gray),
                    onTap: () {},
                  ),
                ),
                verticalSpace(40),
                const Logout()
              ],
            ),
          ),
        );
      },
    );
  }
}
