import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:decimal/decimal.dart';

extension FoodInBasketExtensions on Iterable<FoodInBasket> {
  Decimal get totalPrice => map((e) => e.food.price * Decimal.fromInt(e.count))
      .fold(Decimal.zero, (a, b) => a + b);

  int get totalCount => map((e) => e.count).fold(0, (a, b) => a + b);
}
