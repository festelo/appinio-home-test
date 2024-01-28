import 'dart:collection';

import 'package:appinio_bloc/domain/extensions/food_in_basket.dart';
import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/repositories/basket_repository.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_food_list_page/basket_food_list_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketFoodListCubit extends Cubit<BasketFoodListViewModel> {
  BasketFoodListCubit(this._basketRepository)
      : super(BasketFoodListViewModel.init());

  final BasketRepository _basketRepository;

  Future<void> load() async {
    final foodInBasket = await _basketRepository.list();
    emit(
      state.copyWith(
        foodInBasket: UnmodifiableListView(foodInBasket),
      ),
    );
    recalculateBasketInfo();
  }

  void recalculateBasketInfo() {
    emit(
      state.copyWith(
        totalPrice: state.foodInBasket.totalPrice,
      ),
    );
  }

  Future<void> onAddFood(Food food) async {
    await _basketRepository.add(food);
    emit(state.copyWithFoodCountChange(food, change: 1));
    recalculateBasketInfo();
  }

  Future<void> onRemoveFood(Food food) async {
    await _basketRepository.remove(food);
    emit(state.copyWithFoodCountChange(food, change: -1));
    recalculateBasketInfo();
  }
}
