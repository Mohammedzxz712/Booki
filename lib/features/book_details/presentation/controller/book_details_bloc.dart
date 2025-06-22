

import 'dart:async';

import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/usecase/book_details_usecase.dart';
import 'book_details_event.dart';
import 'book_details_state.dart';




class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {

  final BookDetailsUseCase bookDetailsUseCase;
  final Box<BookDetailsEntity> _cartBox = Hive.box<BookDetailsEntity>('cart');
  BookDetailsBloc(this.bookDetailsUseCase) : super(BookDetailsState()) {
    on<GetBookDetailsEvent>( _onGetBookDetailsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
  }

  FutureOr<void> _onGetBookDetailsEvent(GetBookDetailsEvent event, Emitter<BookDetailsState> emit)async {
    emit(state.copyWith(enBookDetails: EnState.loading));
      final result = await bookDetailsUseCase.getBookDetails(event.bookId);

      result.fold(
            (l) => emit(state.copyWith(enBookDetails: EnState.error, errorMessage: l.message)),
            (r) => emit(state.copyWith(enBookDetails: EnState.loaded, bookDetails: r)),
      );

  }

  FutureOr<void> _onAddToCartEvent(AddToCartEvent event, Emitter<BookDetailsState> emit)async{
    emit(state.copyWith(enBookDetails: EnState.loading));
    try{
      final book = event.book;
      if (_cartBox.containsKey(book.name)) {
        _cartBox.delete(book.name);
      } else {
        _cartBox.put(book.name, book);
      }
      print('Book added to cart: ${book.name}');
      emit(state.copyWith(
        books: _cartBox.values.toList(),
        enBookDetails: EnState.loaded,
      ));
    }catch(e){
      emit(state.copyWith(
        enBookDetails: EnState.error,
        errorMessage: e.toString(),
      ));
    }


  }
}
