import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../book_details/presentation/screen/book_details_screen.dart';
import '../../../domain/entities/book_entitie.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_event.dart';
import '../../controller/home_state.dart';

class BookCardCategories extends StatefulWidget {

  const BookCardCategories({super.key});

  @override
  State<BookCardCategories> createState() => _BookCardCategoriesState();
}

class _BookCardCategoriesState extends State<BookCardCategories> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.enHome != current.enHome,
      builder: (context, state) {

        if (state.enHome == EnState.loading) {
          return const Center(
            child: CircularProgressIndicator(color: ColorsManager.maincolor),
          );
        } else if (state.enHome == EnState.error) {
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  BookDetailsScreen(bookId: state.books[index].id),
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
                             Positioned(
                              top: 10,
                              right: 5,
                              child: InkWell(
                                onTap: (){
                                  context.read<HomeBloc>().add(AddToFavorite(book ));
                                  setState(() {

                                  });
                                },
                                child:  Icon(Icons.favorite,
                                    color: Hive.box<BookEntity>('favorites').containsKey(book.id)?Colors.red:Colors.grey, size: 20),
                              ),
                            ),
                          ],
                        ),
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
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 16),
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
                          )),
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
