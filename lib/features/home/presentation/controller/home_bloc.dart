import 'dart:async';

import 'package:bookly/features/home/presentation/controller/home_event.dart';
import 'package:bookly/features/home/presentation/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/book_entitie.dart';
import '../../domain/usecases/get_best_seller_book.dart';
import '../../domain/usecases/get_book_usecase.dart';
import '../../domain/usecases/search_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBookUseCase getBookUseCase;
  final GetBestSellerBookUseCase getBestSellerBookUseCase;
  final SearchUseCase searchUseCase;
  final Box<BookEntity> _favoritesBox = Hive.box<BookEntity>('favorites');
  HomeBloc(this.getBookUseCase, this.getBestSellerBookUseCase, this.searchUseCase) : super(HomeState()) {
    /// Implement event GetBookHomeEvent
    on<GetBookHomeEvent>(_onGetBookHomeEvent);
    on<GetBookHomeBestSellerEvent>(_onGetBookBestSellerHomeEvent);
    on<GetBookHomeSearchEvent>(_onGetBookSearchEvent);
    on<AddToFavorite>(_onAddToFavorite);
  }

  Future<void> _onGetBookSearchEvent(GetBookHomeSearchEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(enHomeSearch: EnState.loading));
    final result = await searchUseCase.execute(event.categoryType);
    result.fold(
          (l) => emit(state.copyWith(enHomeSearch: EnState.error, errorMessageSearch: l.message)),
          (r) => emit(state.copyWith(enHomeSearch: EnState.loaded, booksSearch: r)),
    );
  }

  Future<void> _onGetBookHomeEvent(GetBookHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(enHome: EnState.loading));
    final result = await getBookUseCase.executeGetBooks(event.categoryType);
    result.fold(
          (l) => emit(state.copyWith(enHome: EnState.error, errorMessage: l.message)),
          (r) => emit(state.copyWith(enHome: EnState.loaded, books: r)),
    );
  }

  Future<void> _onGetBookBestSellerHomeEvent(GetBookHomeBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(enHomeBestSeller: EnState.loading));
    final result = await getBestSellerBookUseCase.executeBestSellerBook(event.categoryType);
    result.fold(
          (l) => emit(state.copyWith(enHomeBestSeller: EnState.error, errorMessageBestSeller: l.message)),
          (r) => emit(state.copyWith(enHomeBestSeller: EnState.loaded, booksBestSeller: r)),
    );
  }


  FutureOr<void> _onAddToFavorite(AddToFavorite event, Emitter<HomeState> emit) async {
    emit(state.copyWith(enHomeSearch: EnState.loading));

    final book = event.book;
    if (_favoritesBox.containsKey(book.id)) {
      _favoritesBox.delete(book.id);
    } else {
      _favoritesBox.put(book.id, book);
    }
    emit(state.copyWith(
      booksSearch: _favoritesBox.values.toList(),
      enHomeSearch: EnState.loaded,
    ));
  }
}
