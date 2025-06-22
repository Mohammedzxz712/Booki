

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/usecase/book_details_usecase.dart';
import 'book_details_event.dart';
import 'book_details_state.dart';




class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {

  final BookDetailsUseCase bookDetailsUseCase;
  BookDetailsBloc(this.bookDetailsUseCase) : super(BookDetailsState()) {
    on<GetBookDetailsEvent>( _onGetBookDetailsEvent);
  }

  FutureOr<void> _onGetBookDetailsEvent(GetBookDetailsEvent event, Emitter<BookDetailsState> emit)async {
    emit(state.copyWith(enBookDetails: EnState.loading));
      final result = await bookDetailsUseCase.getBookDetails(event.bookId);

      result.fold(
            (l) => emit(state.copyWith(enBookDetails: EnState.error, errorMessage: l.message)),
            (r) => emit(state.copyWith(enBookDetails: EnState.loaded, bookDetails: r)),
      );

  }
}
