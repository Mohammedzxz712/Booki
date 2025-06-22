import '../../home/domain/entities/book_entitie.dart';

sealed class FavoritesEvent {}

class LoadFavorites extends FavoritesEvent {}

class RemoveFromFavorite extends FavoritesEvent {
  final BookEntity  book;

  RemoveFromFavorite(this.book);
}
