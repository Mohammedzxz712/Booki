import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/utils.dart';

class BookDetailsState extends Equatable {

  String errorMessage;
  BookDetailsEntity? bookDetails;
  EnState enBookDetails;

  BookDetailsState({
    this.errorMessage = '',
    this.bookDetails,
    this.enBookDetails = EnState.loading,
  });

  @override
  List<Object?> get props => [errorMessage , bookDetails, enBookDetails];

  BookDetailsState copyWith({
    String? errorMessage,
    BookDetailsEntity? bookDetails,
    EnState? enBookDetails,
  }) {
    return BookDetailsState(
        errorMessage: errorMessage ?? this.errorMessage,
        bookDetails: bookDetails ?? this.bookDetails,
        enBookDetails: enBookDetails ?? this.enBookDetails,
    );
  }
}
