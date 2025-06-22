
import 'package:equatable/equatable.dart';

abstract class BookDetailsEvent extends  Equatable{
  const BookDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetBookDetailsEvent extends BookDetailsEvent {
  final String bookId;

  const GetBookDetailsEvent(this.bookId);
}
