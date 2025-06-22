import 'package:equatable/equatable.dart';

import '../../../core/utils/utils.dart';
import '../../home/domain/entities/book_entitie.dart';

class FavoritesState extends Equatable {


  final List<BookEntity> favorites;
  EnState enFavorites;
  String errorMessage;

   FavoritesState({
    this.favorites = const [],
    this.enFavorites = EnState.loading,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [favorites, enFavorites, errorMessage];
  FavoritesState copyWith({
    List<BookEntity>? favorites,
    EnState? enFavorites,
    String? errorMessage,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      enFavorites: enFavorites ?? this.enFavorites,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}


