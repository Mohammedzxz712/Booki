import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../core/utils/utils.dart';
import '../../home/domain/entities/book_entitie.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final Box<BookEntity> _favoritesBox = Hive.box<BookEntity>('favorites');

  FavoritesBloc() : super(FavoritesState(favorites: const [])) {
    on<LoadFavorites>((event, emit) {
      emit(FavoritesState(
        enFavorites: EnState.loading,
      ));
      emit(FavoritesState(
        favorites: _favoritesBox.values.toList(),
        enFavorites: EnState.loaded,
      ));
    });
    on<RemoveFromFavorite>((event, emit) {
      emit(FavoritesState(
        enFavorites: EnState.loading,
      ));

      final book = event.book;
      if (_favoritesBox.containsKey(book.id)) {
        _favoritesBox.delete(book.id);
      }
      emit(FavoritesState(
        favorites: _favoritesBox.values.toList(),
        enFavorites: EnState.loaded,
      ));
    });
  }
}
