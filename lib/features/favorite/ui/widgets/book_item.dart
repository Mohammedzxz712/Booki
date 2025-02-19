import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import 'book_details.dart';

class BookItem extends StatelessWidget {
  Map <String, dynamic> book;
  int index;
  void Function(int index) removeBook;
  BookItem({super.key, required this.book, required this.index, required this.removeBook});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(book['title']!),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => removeBook(index),
      background:Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: book['imageUrl']!,
                fit: BoxFit.cover,
                width: 100.w,
                height: 120.h,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.maincolor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child:BookDetails(book: book),
            ),
            Icon(
              Icons.bookmark,
              color: ColorsManager.maincolor,
              size: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
