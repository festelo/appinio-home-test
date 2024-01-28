import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';

class FoodListViewModel {
  const FoodListViewModel({
    required this.foodList,
    required this.isLoading,
    required this.isError,
    required this.filter,
    required this.searchPhrase,
    required this.filteredFoodList,
  });

  FoodListViewModel.init()
      : foodList = UnmodifiableListView([]),
        isLoading = true,
        isError = false,
        filter = FoodFilter.all,
        filteredFoodList = UnmodifiableListView([]),
        searchPhrase = '';

  final UnmodifiableListView<Food> foodList;

  final bool isLoading;

  final bool isError;

  final FoodFilter filter;

  final String searchPhrase;

  final UnmodifiableListView<Food> filteredFoodList;

  int get currentTab => switch (filter) {
        FoodFilter.all => 0,
        FoodFilter.favorite => 1,
      };

  FoodListViewModel copyWith({
    UnmodifiableListView<Food>? foodList,
    bool? isLoading,
    bool? isError,
    FoodFilter? filter,
    String? searchPhrase,
    UnmodifiableListView<Food>? filteredFoodList,
  }) {
    return FoodListViewModel(
      foodList: foodList ?? this.foodList,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      filter: filter ?? this.filter,
      searchPhrase: searchPhrase ?? this.searchPhrase,
      filteredFoodList: filteredFoodList ?? this.filteredFoodList,
    );
  }

  FoodListViewModel copyWithFoodFavorite(
    Food food, {
    required bool isFavorite,
  }) {
    return copyWith(
      foodList: UnmodifiableListView(
        foodList
            .map((f) => f == food ? f.copyWith(isFavorite: isFavorite) : f)
            .toList(),
      ),
    );
  }
}

enum FoodFilter {
  all,
  favorite,
}
