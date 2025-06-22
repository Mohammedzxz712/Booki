import 'package:bookly/features/home/domain/entities/book_entitie.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/utils.dart';

class HomeState extends Equatable {
  String errorMessage;
  List<BookEntity> books;
  EnState enHome;

  String errorMessageBestSeller;
  List<BookEntity> booksBestSeller;
  EnState enHomeBestSeller;

  String errorMessageSearch;
  List<BookEntity> booksSearch;
  EnState enHomeSearch;

  HomeState({
    this.errorMessage = '',
    this.books = const [],
    this.enHome = EnState.loading,
    this.errorMessageBestSeller = '',
    this.booksBestSeller = const [],
    this.enHomeBestSeller = EnState.loading,
    this.errorMessageSearch = '',
    this.booksSearch = const [],
    this.enHomeSearch = EnState.loading,
  });


  @override
  List<Object> get props => [ errorMessage,  books, enHome, errorMessageBestSeller, booksBestSeller, enHomeBestSeller, errorMessageSearch, booksSearch, enHomeSearch];

  HomeState copyWith({
    String? errorMessage,
    List<BookEntity>? books,
    EnState? enHome,
    String? errorMessageBestSeller,
    List<BookEntity>? booksBestSeller,
    EnState? enHomeBestSeller,
    String? errorMessageSearch,
    List<BookEntity>? booksSearch,
    EnState? enHomeSearch,
    List<String>? favoritesIds,
  }) {
    return HomeState(
        errorMessage: errorMessage ?? this.errorMessage,
        books: books ?? this.books,
        enHome: enHome ?? this.enHome,
        errorMessageBestSeller: errorMessageBestSeller ??
            this.errorMessageBestSeller,
        booksBestSeller: booksBestSeller ?? this.booksBestSeller,
        enHomeBestSeller: enHomeBestSeller ?? this.enHomeBestSeller,
        errorMessageSearch: errorMessageSearch ?? this.errorMessageSearch,
        booksSearch: booksSearch ?? this.booksSearch,
        enHomeSearch: enHomeSearch ?? this.enHomeSearch
    );
  }
}
