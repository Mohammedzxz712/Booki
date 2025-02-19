import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:bookly/features/book_details/ui/widgets/book_info.dart';
import 'package:bookly/features/book_details/ui/widgets/category_chip.dart';
import 'package:flutter/material.dart';

import '../widgets/book_cover.dart';
import '../widgets/book_name_and_author.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/price_of_book.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            // Cover photo height
            backgroundColor: Colors.transparent,
            title: Text(
              'Book Details',
              style: TextStyles.font20WhiteSemiBold,
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Navigate back
              },
            ),
            flexibleSpace: const FlexibleSpaceBar(
              background: BookCoverWithBackground(
                  backgroundImage:
                      'https://s3-alpha-sig.figma.com/img/96e9/75f1/2e0ed98ae076953e2a6bd6a827cc5e2b?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QRRQTuSb9793D3gKiuKHPA73x2iPA9IMlXMVZFpxysS-MzgrTQWVwMebdEuOWH~4QqdvU8IFRVWSW6UOWsHMz2mURgf2olFGrInC2pu-ahbGlqRguI6rOwY6~1u1cd-vZRvqKd53k19F~~4N6g-JMB8j55yJjgUSJexIzmQVD91QIBa9x~knoa99rOQcM5yEsWo1TKW0ubfQQGTR2L9NgsIHhNWq98B4YyfzZTV9ZirWBBUYrG2OacRQHwQJUU~bqyszveAEYn4qWcoeE5GPHQeyRupE8PBF58cTi9uqrXBn2ZRJmJpCL4e7MPppEgh2MpxuS7VMcbmnPzkoh1q32Q__',
                  bookCoverImage:
                      'https://s3-alpha-sig.figma.com/img/96e9/75f1/2e0ed98ae076953e2a6bd6a827cc5e2b?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QRRQTuSb9793D3gKiuKHPA73x2iPA9IMlXMVZFpxysS-MzgrTQWVwMebdEuOWH~4QqdvU8IFRVWSW6UOWsHMz2mURgf2olFGrInC2pu-ahbGlqRguI6rOwY6~1u1cd-vZRvqKd53k19F~~4N6g-JMB8j55yJjgUSJexIzmQVD91QIBa9x~knoa99rOQcM5yEsWo1TKW0ubfQQGTR2L9NgsIHhNWq98B4YyfzZTV9ZirWBBUYrG2OacRQHwQJUU~bqyszveAEYn4qWcoeE5GPHQeyRupE8PBF58cTi9uqrXBn2ZRJmJpCL4e7MPppEgh2MpxuS7VMcbmnPzkoh1q32Q__'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BookAndAuthorName( title: "Game of Thrones", author: "George R.R. Martin"),
                   Row(
                    children: [
                      const PriceOfBook(price: "20.00"),
                      horizontalSpace(10),
                      const BookInfoCard(
                        title1: "Rating",
                        value1: "4.5",
                        title2: "N. Pages",
                        value2: "694",
                        title3: "Language",
                        value3: "English",
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(5),
                   Text(
                    "Game Of Thrones is the first book in the A Song Of Ice and Fire "
                    "series by George R.R. Martin. It explores political intrigue, wars, "
                    "and dramatic twists in a fictional world. The TV series is adapted "
                    "from these books.",
                    style: TextStyles.font14GrayRegular,),
                  verticalSpace(16),
                  const Wrap(
                    spacing: 7.0,
                    children: [
                      CategoryChip(label: "Fantasy"),
                      CategoryChip(label: "Science"),
                      CategoryChip(label: "Detective"),
                      CategoryChip(label: "Adventure"),
                    ],
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}






