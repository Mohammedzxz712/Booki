import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../book_details/presentation/screen/book_details_screen.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_state.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.enHomeSearch) {
          case EnState.loading:
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.maincolor),
            );
          case EnState.error:
            return Center(
              child: Text(state.errorMessageSearch),
            );
          case EnState.loaded:
            return SizedBox(
              height: 500.h, // Adjust height based on your screen
              child: ListView.builder(
                scrollDirection: Axis.vertical, // Scroll vertically
                itemCount: state.booksSearch.length,
                itemBuilder: (context, index) {
                  final book = state.booksSearch[index];

                  return SizedBox(
                    // height: 222.h, // Adjust the height of each item
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  BookDetailsScreen(bookId: state.booksSearch[index].id),
                                  ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 144.h,
                                    width: 128.w,
                                    child: CachedNetworkImage(
                                      imageUrl: book.imageUrl,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                            color: ColorsManager.maincolor),
                                      ),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.broken_image, size: 50),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 10,
                                    right: 5,
                                    child: Icon(Icons.favorite, color: Colors.red, size: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                verticalSpace(5),
                                Text(
                                  book.author,
                                  style: const TextStyle(color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                verticalSpace(5),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                                    Text(book.rate.toString()),
                                    const Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        text: 'EG ',
                                        style: const TextStyle(
                                            color: ColorsManager.maincolor, fontSize: 11),
                                        children: [
                                          TextSpan(
                                            text: '${book.price}',
                                            style: const TextStyle(
                                                color: ColorsManager.maincolor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          default:
            return Container();

        }
      },
    );
  }
}