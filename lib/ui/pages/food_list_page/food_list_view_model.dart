// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class FoodListViewModel extends Equatable {
  const FoodListViewModel({
    required this.foodList,
    required this.isLoading,
    required this.isError,
    required this.filter,
    required this.searchPhrase,
    required this.filteredFoodList,
    required this.basketTotalPrice,
    required this.basketFoodCount,
  });

  FoodListViewModel.init()
      : foodList = UnmodifiableListView([]),
        isLoading = true,
        isError = false,
        filter = FoodFilter.all,
        filteredFoodList = UnmodifiableListView([]),
        searchPhrase = '',
        basketFoodCount = 0,
        basketTotalPrice = Decimal.zero;

  final UnmodifiableListView<Food> foodList;

  final bool isLoading;

  final bool isError;

  final FoodFilter filter;

  final String searchPhrase;

  final UnmodifiableListView<Food> filteredFoodList;

  final int basketFoodCount;

  final Decimal basketTotalPrice;

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
    Decimal? basketTotalPrice,
    int? basketFoodCount,
  }) {
    return FoodListViewModel(
      foodList: foodList ?? this.foodList,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      filter: filter ?? this.filter,
      searchPhrase: searchPhrase ?? this.searchPhrase,
      filteredFoodList: filteredFoodList ?? this.filteredFoodList,
      basketTotalPrice: basketTotalPrice ?? this.basketTotalPrice,
      basketFoodCount: basketFoodCount ?? this.basketFoodCount,
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

  @override
  List<Object> get props {
    return [
      foodList,
      isLoading,
      isError,
      filter,
      searchPhrase,
      filteredFoodList,
      basketTotalPrice,
      basketFoodCount,
    ];
  }
}

enum FoodFilter {
  all,
  favorite,
}
