import 'package:appinio_bloc/domain/model/food.dart';

class FoodInBasket {
  const FoodInBasket({
    required this.food,
    required this.count,
  });

  final Food food;
  final int count;

  FoodInBasket copyWith({
    Food? food,
    int? count,
  }) {
    return FoodInBasket(
      food: food ?? this.food,
      count: count ?? this.count,
    );
  }
}
