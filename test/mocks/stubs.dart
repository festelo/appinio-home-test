// ignore_for_file: lines_longer_than_80_chars

import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:decimal/decimal.dart';

class Stubs {
  static final List<Food> foodList = [
    Food(
      id: '1',
      name: 'Cheese Pizza',
      description:
          'This classic cheese pizza recipe makes a chewy crust, homemade tomato sauce, and three different types of cheese',
      imageUrl: '',
      isFavorite: false,
      price: Decimal.fromInt(10),
    ),
    Food(
      id: '2',
      name: 'Tomato Mozzarella Pizza',
      description:
          "Starring juicy tomatoes, fresh creamy mozzarella, and herbaceous basil, this tomato mozzarella pizza is a tomato lover's dream pizza",
      imageUrl: '',
      isFavorite: false,
      price: Decimal.fromInt(10),
    ),
    Food(
      id: '3',
      name: 'Cheeseburger Pizza',
      description:
          "This easy Cheeseburger Pizza is topped with a creamy burger sauce, ground beef and plenty of cheese. Don't forget the pickles!",
      imageUrl: '',
      isFavorite: false,
      price: Decimal.fromInt(10),
    ),
    Food(
      id: '4',
      name: 'Pizza Marinara',
      description:
          'Traditionally, the dough is made with flour, yeast, water, and salt, whereas the topping consists of peeled, milled, and salted tomatoes, oregano, garlic',
      imageUrl: '',
      isFavorite: false,
      price: Decimal.fromInt(10),
    ),
    Food(
      id: '5',
      name: 'Pizza Crazy Dog',
      description:
          'A thick layer of homemade beef chili, two types of cheese smothered on top, and of course, the king of the pizza, oven roasted hot dogs.',
      imageUrl: '',
      isFavorite: false,
      price: Decimal.fromInt(10),
    ),
  ];

  static final List<FoodInBasket> foodInBasket = [
    FoodInBasket(food: foodList[0], count: 2),
    FoodInBasket(food: foodList[1], count: 1),
  ];
}
