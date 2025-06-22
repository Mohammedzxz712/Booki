import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/core/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_snakbar.dart';
import '../../../home/domain/entities/book_entitie.dart';
import '../../controller/favorite_bloc.dart';
import '../../controller/favorite_event.dart';
import '../../controller/favorite_state.dart';

import '../widgets/book_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    super.initState();
    _favoritesBloc = FavoritesBloc()..add(LoadFavorites());
  }

  void _removeBook(BookEntity book) {
    _favoritesBloc.add(RemoveFromFavorite(book));
    AppSnackBar.show(
      context: context,
      message: 'Book removed from favorites',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _favoritesBloc,
      child: Scaffold(

        appBar: AppBar(
          title: Text('Favorite Books', style: TextStyles.font24BlackBold),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: ColorsManager.offWhite,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              // if (state.favorites.isEmpty) {
              //   return const Center(
              //     child: Text('No favorite books found.'),
              //   );
              // }
              if (state.enFavorites == EnState.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.maincolor,
                  ),
                );
              }


              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.favorites.length,
                separatorBuilder: (context, index) => const AppDivider(),
                itemBuilder: (context, index) {
                  final book = state.favorites[index];
                  return BookItem(
                    book: book,
                    index: index,
                    removeBook: (_) => _removeBook(book),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
