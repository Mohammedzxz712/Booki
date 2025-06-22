import 'package:bookly/features/home/domain/entities/book_entitie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class BookDetails extends StatelessWidget {

  BookEntity? book ;
  BookDetails({super.key,   this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          book?.title??'unknown',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(4),
        Text(
          book?.author??'unknown',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
        verticalSpace(4),
        Text(
          book?.description??'',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font12GrayRegular,
        ),


        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow, size: 16),
            Text(book?.rate.toString()??'0.0'.toString(), style: TextStyles.font12GrayRegular),
            const Spacer(),
            Text('\$${book?.price}'??'0.0', style: TextStyles.font12GrayRegular),
          ],
        ),
      ],
    );
  }
}
