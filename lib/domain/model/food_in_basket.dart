import 'package:appinio_bloc/domain/model/food.dart';

class FoodInBasket {
  const FoodInBasket({
    required this.food,
    required this.count,
  });

  final Food food;
  final int count;
}
