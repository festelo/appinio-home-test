import 'package:appinio_bloc/domain/model/food.dart';

class FoodDetailsResult {
  FoodDetailsResult({
    required this.food,
    required this.wasAddedToBasket,
  });

  final Food food;
  final bool wasAddedToBasket;
}
