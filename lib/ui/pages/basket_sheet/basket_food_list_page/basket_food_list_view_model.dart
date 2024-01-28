// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:decimal/decimal.dart';

class BasketFoodListViewModel {
  const BasketFoodListViewModel({
    required this.foodInBasket,
  });

  const BasketFoodListViewModel.init() : foodInBasket = const [];

  final List<FoodInBasket> foodInBasket;
  Decimal get totalPrice => Decimal.parse('123.32');

  BasketFoodListViewModel copyWith({
    List<FoodInBasket>? foodInBasket,
  }) {
    return BasketFoodListViewModel(
      foodInBasket: foodInBasket ?? this.foodInBasket,
    );
  }
}
