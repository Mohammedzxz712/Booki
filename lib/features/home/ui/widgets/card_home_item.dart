import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,

      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: Stack(
              children: [
                SizedBox(
                  height: 128,
                  width: 128.w,
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/96e9/75f1/2e0ed98ae076953e2a6bd6a827cc5e2b?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QRRQTuSb9793D3gKiuKHPA73x2iPA9IMlXMVZFpxysS-MzgrTQWVwMebdEuOWH~4QqdvU8IFRVWSW6UOWsHMz2mURgf2olFGrInC2pu-ahbGlqRguI6rOwY6~1u1cd-vZRvqKd53k19F~~4N6g-JMB8j55yJjgUSJexIzmQVD91QIBa9x~knoa99rOQcM5yEsWo1TKW0ubfQQGTR2L9NgsIHhNWq98B4YyfzZTV9ZirWBBUYrG2OacRQHwQJUU~bqyszveAEYn4qWcoeE5GPHQeyRupE8PBF58cTi9uqrXBn2ZRJmJpCL4e7MPppEgh2MpxuS7VMcbmnPzkoh1q32Q__',
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  top: 10,
                  right: 5,
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                )
              ],
            ),
          ),
          verticalSpace(5),
          const Text(
            'Book Title',
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            'Author Name',
            style: TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width:144,
            child:  Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
                const Text('4.5'),
                const Spacer(),

                const Text('\$10.99', style: TextStyle(fontWeight: FontWeight.bold)),
                horizontalSpace(3),
              ],
            ),
          )
        ],
      ),
    );
  }
}