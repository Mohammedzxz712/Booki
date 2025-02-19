import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class RowProfile extends StatelessWidget {
  const RowProfile({
    super.key,
    required this.prefixIcon,
    required this.title,
    required this.onTap,
  });

  final Widget prefixIcon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prefixIcon,
        horizontalSpace(22),
        Text(
          title,
          style: TextStyles.font14GrayRegular,
        ),
        const Spacer(),
         InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_forward_ios,
            color: ColorsManager.gray,
            size: 16,
          ),
        )
      ],
    );
  }
}
