import 'dart:collection';

import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:decimal/decimal.dart';

class BasketAddressViewModel {
  const BasketAddressViewModel({
    required this.foodInBasket,
    required this.totalPrice,
    required this.street,
    required this.floor,
    required this.comment,
  });

  BasketAddressViewModel.init()
      : foodInBasket = UnmodifiableListView([]),
        totalPrice = Decimal.zero,
        street = '',
        floor = '',
        comment = '';

  final UnmodifiableListView<FoodInBasket> foodInBasket;
  final Decimal totalPrice;
  final String street;
  final String floor;
  final String comment;

  bool get formValid => street.trim().isNotEmpty;

  BasketAddressViewModel copyWith({
    UnmodifiableListView<FoodInBasket>? foodInBasket,
    Decimal? totalPrice,
    String? street,
    String? floor,
    String? comment,
  }) {
    return BasketAddressViewModel(
      foodInBasket: foodInBasket ?? this.foodInBasket,
      totalPrice: totalPrice ?? this.totalPrice,
      street: street ?? this.street,
      floor: floor ?? this.floor,
      comment: comment ?? this.comment,
    );
  }
}
