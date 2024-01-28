// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';

class FoodListViewModel {
  FoodListViewModel({
    required this.foodList,
    required this.isLoading,
    required this.isError,
    required this.filter,
  });

  FoodListViewModel.init()
      : foodList = [],
        isLoading = true,
        isError = false,
        filter = FoodFilter.all;

  final List<Food> foodList;

  final bool isLoading;

  final bool isError;

  final FoodFilter filter;

  UnmodifiableListView<Food> get filteredFoods =>
      UnmodifiableListView(foodList);

  int get currentTab => switch (filter) {
        FoodFilter.all => 0,
        FoodFilter.favorite => 1,
      };

  FoodListViewModel copyWith({
    List<Food>? foodList,
    bool? isLoading,
    bool? isError,
    FoodFilter? filter,
  }) {
    return FoodListViewModel(
      foodList: foodList ?? this.foodList,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      filter: filter ?? this.filter,
    );
  }
}

enum FoodFilter {
  all,
  favorite,
}
