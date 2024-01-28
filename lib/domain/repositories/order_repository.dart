// ignore_for_file: one_member_abstracts

import 'package:appinio_bloc/domain/model/food_in_basket.dart';

abstract class OrderRepository {
  Future<void> order(List<FoodInBasket> foodInBasket);
}
