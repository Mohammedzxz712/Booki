import 'package:equatable/equatable.dart';

import '../../domain/entities/book_entitie.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}
///todo implement GetBookHomeEvent
class GetBookHomeEvent extends HomeEvent {
  final  String categoryType;

   const GetBookHomeEvent(this.categoryType);
}

class GetBookHomeBestSellerEvent extends HomeEvent {

  final String categoryType;

  const GetBookHomeBestSellerEvent(this.categoryType);
}
class GetBookHomeSearchEvent extends HomeEvent {

  final String categoryType;

  const GetBookHomeSearchEvent(this.categoryType);
}
class AddToFavorite extends HomeEvent {
  final BookEntity  book;

  const AddToFavorite(this.book);
}