import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.order,
  });

  final BookDetailsEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey,width: 1),

      ),
      child: Row(
        children: [
          // Book Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: order.imageUrl??'',
              width: 80.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.name??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(

                    fontSize: 14.sp,

                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(3),
                Text(
                  order.author??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                verticalSpace(3),
                Text(
                  '${order.price} \$',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Track Button
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Track',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}