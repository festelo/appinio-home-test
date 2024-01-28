// ignore_for_file: one_member_abstracts

import 'package:appinio_bloc/domain/model/food_in_basket.dart';

abstract class OrderRepository {
  Future<void> order({
    required List<FoodInBasket> foodInBasket,
    required String street,
    required String floor,
    required String comment,
  });
}
