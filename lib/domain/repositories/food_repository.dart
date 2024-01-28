import 'package:appinio_bloc/domain/model/food.dart';

abstract class FoodRepository {
  Future<List<Food>> list();
  Future<void> like(Food food);
  Future<void> dislike(Food food);
}
