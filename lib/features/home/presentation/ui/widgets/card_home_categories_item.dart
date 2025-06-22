import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/utils/utils.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_state.dart';

class BookCardCategories extends StatelessWidget {
  const BookCardCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (kDebugMode) {
          print(state.enHome);
        }

        if (state.enHome == EnHome.loading) {
          return const Center(
            child: CircularProgressIndicator(color: ColorsManager.maincolor),
          );
        } else if (state.enHome == EnHome.error) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state.books.isEmpty) {
          return const Center(
            child: Text("No books available."),
          );
        }

        return SizedBox(
          height: 222.h, // Adjust height based on design
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];

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
                            height: 144.h,
                            width: 128.w,
                            child: CachedNetworkImage(
                              imageUrl: book.imageUrl,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(color: ColorsManager.maincolor),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 50),
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
                    verticalSpace(5),
                    Text(
                      book.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.author,
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 144,
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text(book.rate.toString()),
                          const Spacer(),
                          Text(
                            '\$${book.price}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          horizontalSpace(3),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
