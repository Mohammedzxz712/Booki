import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/assets.dart';
import '../../logic/profile_cubit.dart';

class ImageNameAndUserName extends StatelessWidget {
  const ImageNameAndUserName({
    super.key,
    required this.profileCubit,
  });

  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 55.r,
              backgroundImage: profileCubit.profilePhoto != null
                  ? FileImage(profileCubit.profilePhoto!)
              as ImageProvider
                  : const AssetImage(Assets.imagesMohammed),
            ),
            InkWell(
              onTap: () {
                profileCubit.getProfileImage();
              },
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManager.maincolor,
                child: const Icon(Icons.camera_alt_outlined,
                    color: Colors.white),
              ),
            )
          ],
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohammed Rageh',
              style: TextStyles.font16BlackBold,
            ),
            verticalSpace(10),
            Text(
              'mohammedragehzxz@gmail.com',
              style: TextStyles.font12MainColorRegular,
            ),
          ],
        )
      ],
    );
  }
}