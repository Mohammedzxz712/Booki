import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/utils.dart';

class BookDetailsState extends Equatable {

  String errorMessage;
  BookDetailsEntity? bookDetails;
  List<BookDetailsEntity>? books;
  EnState enBookDetails;

  BookDetailsState({
    this.errorMessage = '',
    this.bookDetails,
    this.enBookDetails = EnState.loading,
    this.books,
  });

  @override
  List<Object?> get props => [errorMessage , bookDetails, enBookDetails , books];

  BookDetailsState copyWith({
    String? errorMessage,
    BookDetailsEntity? bookDetails,
    EnState? enBookDetails,
    List<BookDetailsEntity>? books,
  }) {
    return BookDetailsState(
        errorMessage: errorMessage ?? this.errorMessage,
        bookDetails: bookDetails ?? this.bookDetails,

        enBookDetails: enBookDetails ?? this.enBookDetails,
        books: books ?? this.books,
    );
  }
}
