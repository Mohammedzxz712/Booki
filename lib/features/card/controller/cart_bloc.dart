import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/utils.dart';
import '../../book_details/domain/entity/book_details_entity.dart';
import 'cart_event.dart';
import 'cart_state.dart';




class CartBloc extends Bloc<CartEvent, CartState> {
  final Box<BookDetailsEntity> _cartBox = Hive.box<BookDetailsEntity>('cart');

  CartBloc() : super(CartState(carts: const [])) {
    on<GetCartEvent>((event, emit) {
      emit(CartState(
        enCart: EnState.loading,
      ));
      emit(CartState(
        carts: _cartBox.values.toList(),
        enCart: EnState.loaded,
      ));
    });
  }
}
