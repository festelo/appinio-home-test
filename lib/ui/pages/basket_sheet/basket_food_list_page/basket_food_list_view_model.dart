import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:decimal/decimal.dart';

class BasketFoodListViewModel {
  const BasketFoodListViewModel({
    required this.foodInBasket,
    required this.totalPrice,
  });

  BasketFoodListViewModel.init()
      : foodInBasket = UnmodifiableListView([]),
        totalPrice = Decimal.zero;

  final UnmodifiableListView<FoodInBasket> foodInBasket;
  final Decimal totalPrice;

  BasketFoodListViewModel copyWith({
    UnmodifiableListView<FoodInBasket>? foodInBasket,
    Decimal? totalPrice,
  }) {
    return BasketFoodListViewModel(
      foodInBasket: foodInBasket ?? this.foodInBasket,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  BasketFoodListViewModel copyWithFoodCountChange(
    Food food, {
    required int change,
  }) {
    return copyWith(
      foodInBasket: UnmodifiableListView(
        foodInBasket
            .map(
              (f) => f.food == food ? f.copyWith(count: f.count + change) : f,
            )
            .where((f) => f.count > 0)
            .toList(),
      ),
    );
  }
}
