import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/model/food_in_basket.dart';

abstract class BasketRepository {
  Future<List<FoodInBasket>> list();
  Future<void> add(Food food);
  Future<void> remove(Food food);
  Future<void> clear();
}
