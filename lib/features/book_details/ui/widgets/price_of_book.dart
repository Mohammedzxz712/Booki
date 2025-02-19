import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceOfBook extends StatelessWidget {
  final String price;

  const PriceOfBook({
    super.key,
    required this.price,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 66.h,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Price', style: TextStyle(fontSize: 14, color: Colors.black54)),
             verticalSpace(4),
              Text(
                '\$$price',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),

         Positioned(
          top: 7,
          left: 0,
          right: 55,
          child:Image.asset(
           Assets.imagesLocalOffer,
            width: 15,
            height: 15,
          ),
        ),
      ],
    )
;
  }
}