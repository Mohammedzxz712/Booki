import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/di/dependency_injection.dart';
import '../../../../core/utils/utils.dart';
import '../controller/book_details_bloc.dart';
import '../controller/book_details_event.dart';
import '../controller/book_details_state.dart';
import '../ui/widgets/book_cover.dart';
import '../ui/widgets/book_info.dart';
import '../ui/widgets/book_name_and_author.dart';
import '../ui/widgets/bottom_navbar.dart';
import '../ui/widgets/category_chip.dart';
import '../ui/widgets/price_of_book.dart';

class BookDetailsScreen extends StatelessWidget {
  final String bookId;

  const BookDetailsScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          sl<BookDetailsBloc>()..add(GetBookDetailsEvent(bookId)),
      child: BlocBuilder<BookDetailsBloc, BookDetailsState>(
        builder: (context, state) {
          switch (state.enBookDetails) {
            case EnState.loading:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.maincolor,
                  ),
                ),
              );
            case EnState.loaded:
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
                      flexibleSpace: FlexibleSpaceBar(
                        background: BookCoverWithBackground(
                            backgroundImage: '${state.bookDetails?.imageUrl}',
                            bookCoverImage: '${state.bookDetails?.imageUrl}'),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BookAndAuthorName(
                                title: '${state.bookDetails?.name}',
                                author: '${state.bookDetails?.author}'),
                            Row(
                              children: [
                                PriceOfBook(
                                  price: '${state.bookDetails?.price}',),
                                horizontalSpace(7),
                                BookInfoCard(
                                  rate: "${state.bookDetails?.rating}",

                                  numOfPages: "${state.bookDetails?.numberOfPages}",

                                  language: "${state.bookDetails?.language}",
                                ),
                              ],
                            ),
                            verticalSpace(20),
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            verticalSpace(5),
                            Text(
                              "${state.bookDetails?.description}",
                              style: TextStyles.font14GrayRegular,
                            ),
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
            case EnState.error:
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }
}
