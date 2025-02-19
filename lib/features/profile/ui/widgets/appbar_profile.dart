import 'package:bookly/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarProfile extends StatelessWidget  implements PreferredSizeWidget {
  const AppBarProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'My Profile',
        style: TextStyles.font24BlackBold,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);
}
