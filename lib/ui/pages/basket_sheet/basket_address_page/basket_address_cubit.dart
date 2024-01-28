import 'dart:collection';

import 'package:appinio_bloc/domain/extensions/food_in_basket.dart';
import 'package:appinio_bloc/domain/repositories/basket_repository.dart';
import 'package:appinio_bloc/domain/repositories/order_repository.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketAddressCubit extends Cubit<BasketAddressViewModel> {
  BasketAddressCubit(this._basketRepository, this._orderRepository)
      : super(BasketAddressViewModel.init());

  final BasketRepository _basketRepository;
  final OrderRepository _orderRepository;

  Future<void> load() async {
    final foodInBasket = await _basketRepository.list();
    emit(
      state.copyWith(
        totalPrice: foodInBasket.totalPrice,
        foodInBasket: UnmodifiableListView(foodInBasket),
      ),
    );
  }

  void onStreetChanged(String value) {
    emit(state.copyWith(street: value));
  }

  void onFloorChanged(String value) {
    emit(state.copyWith(floor: value));
  }

  void onCommentChanged(String value) {
    emit(state.copyWith(comment: value));
  }

  Future<void> onConfirmOrder() async {
    try {
      await _orderRepository.order(
        foodInBasket: state.foodInBasket,
        street: state.street,
        floor: state.floor,
        comment: state.comment,
      );
      await _basketRepository.clear();
    } catch (e) {
      // todo: handle error
      rethrow;
    }
  }
}
