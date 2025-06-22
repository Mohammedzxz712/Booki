import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/utils.dart';

class PageItem extends StatelessWidget {
  final int index;
  const PageItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          onBoardingList[index].image,
          fit: BoxFit.fill,
          width: double.infinity,
          height: 350.h,
        ),
        verticalSpace(24),
        Text(
          onBoardingList[index].title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        verticalSpace(20),
        Text(
          onBoardingList[index].description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        verticalSpace(20),

      ],
    );
  }
}
