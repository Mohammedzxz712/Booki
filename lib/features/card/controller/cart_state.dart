

import '../../book_details/domain/entity/book_details_entity.dart';

import 'package:equatable/equatable.dart';

import '../../../core/utils/utils.dart';

class CartState extends Equatable {


  final List<BookDetailsEntity> carts;
  EnState enCart;
  String errorMessage;

  CartState({
    this.carts = const [],
    this.enCart = EnState.loading,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [carts, enCart, errorMessage];
  CartState copyWith({
    List<BookDetailsEntity>? carts,
    EnState? enCart,
    String? errorMessage,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      enCart: enCart ?? this.enCart,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}



