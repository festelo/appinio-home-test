import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/pages/food_list_page/food_list_view_model.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const pizzaList = [
  [
    "Cheese Pizza",
    "This classic cheese pizza recipe makes a chewy crust, homemade tomato sauce, and three different types of cheese",
    "https://milanoweimar.de/wp-content/uploads/pizza-magherita.png",
  ],
  [
    "Tomato Mozzarella Pizza",
    "Starring juicy tomatoes, fresh creamy mozzarella, and herbaceous basil, this tomato mozzarella pizza is a tomato lover's dream pizza",
    "https://milanoweimar.de/wp-content/uploads/pizza-tomate-mozzarella-420x420.png",
  ],
  [
    "Cheeseburger Pizza",
    "This easy Cheeseburger Pizza is topped with a creamy burger sauce, ground beef and plenty of cheese. Don't forget the pickles!",
    "https://milanoweimar.de/wp-content/uploads/pizza-cheeseburger.png",
  ],
  [
    "Pizza Marinara",
    "Traditionally, the dough is made with flour, yeast, water, and salt, whereas the topping consists of peeled, milled, and salted tomatoes, oregano, garlic",
    "https://milanoweimar.de/wp-content/uploads/pizza-meeresfr%C3%BCchte.png",
  ],
  [
    "Pizza Crazy Dog",
    "A thick layer of homemade beef chili, two types of cheese smothered on top, and of course, the king of the pizza, oven roasted hot dogs.",
    "https://milanoweimar.de/wp-content/uploads/pizza-crazy-dog.png",
  ]
];

class FoodListCubit extends Cubit<FoodListViewModel> {
  FoodListCubit() : super(FoodListViewModel.init());

  Future<void> load() async {
    var i = 0;
    emit(
      state.copyWith(
        foodList: pizzaList
            .map(
              (p) => Food(
                id: 'id',
                name: p[0],
                description: p[1],
                imageUrl: p[2],
                price: Decimal.parse('8.99'),
                isFavorite: i++ % 5 == 1,
              ),
            )
            .toList(),
      ),
    );
  }

  void changeFilter(FoodFilter filter) {
    emit(
      state.copyWith(filter: filter),
    );
  }
}
