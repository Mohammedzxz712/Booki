
import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';
import 'package:bookly/features/home/domain/entities/book_entitie.dart';
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

class AddToCartEvent extends BookDetailsEvent {
  final BookDetailsEntity book;

  const AddToCartEvent(this.book);
}
