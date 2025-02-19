import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class BookDetails extends StatelessWidget {

  Map<String ,dynamic> book ;
  BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          book['title']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(4),
        Text(
          book['description']!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font12GrayRegular,
        ),
        verticalSpace(4),
        Text(
          book['date']!,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow, size: 16),
            Text('4.5', style: TextStyles.font12GrayRegular),
            const Spacer(),
            Text('\$10.99', style: TextStyles.font12GrayRegular),
          ],
        ),
      ],
    );
  }
}
