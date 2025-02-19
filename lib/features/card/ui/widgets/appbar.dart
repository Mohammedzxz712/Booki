import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarCart extends StatelessWidget  implements PreferredSizeWidget {
  const AppBarCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
    );

  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);

}
