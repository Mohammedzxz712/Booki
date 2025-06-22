import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class BookAndAuthorName extends StatelessWidget {
  const BookAndAuthorName({
    super.key,
    required this.title,
    required this.author,
  });
  final String title;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          verticalSpace(16),
          Text(
            title,
            style: TextStyles.font22BlackBold,
          ),
          Text(
            author,
            style: TextStyles.font14GrayRegular,
          ),     verticalSpace(22),
        ],
      ),
    );
  }
}