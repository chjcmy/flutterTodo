import 'package:apple_store/common/product.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CartEvent {
  const CartEvent();
}

class OnProductPressed extends CartEvent {
  final Product product;

  const OnProductPressed(this.product);
}

class CartBloc extends Bloc<CartEvent, List<Product>> {
  CartBloc() : super([]) {
    on<OnProductPressed>((event, emit) {
      if (state.contains(event.product)) {
        // state.remove(event.product);
        // emit(state);
        emit(state.where((element) => element != event.product).toList());
      } else {
        // state.add(event.product);
        // emit(state);
        emit([...state, event.product]);
      }
    });
  }
}
