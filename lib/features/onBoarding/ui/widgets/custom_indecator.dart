import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/utils.dart';

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({
    super.key,
    required this.boardController,
  });

  final PageController boardController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: boardController,
          count: onBoardingList.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: ColorsManager.maincolor,
            dotColor: Colors.grey,
            dotHeight: 7,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 5,
          ),
        ),
      ],
    );
  }
}