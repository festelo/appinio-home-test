// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';

abstract class FavoriteFoodListViewModel {
  UnmodifiableListView<Food> get filteredFoods;
  bool get isLoading;
  bool get isError;
}

class FavoriteFoodListViewModelImpl implements FavoriteFoodListViewModel {
  FavoriteFoodListViewModelImpl({
    required this.foodList,
    required this.isLoading,
    required this.isError,
  });

  FavoriteFoodListViewModelImpl.init()
      : foodList = [],
        isLoading = true,
        isError = false;

  final List<Food> foodList;

  @override
  final bool isLoading;

  @override
  final bool isError;

  @override
  UnmodifiableListView<Food> get filteredFoods =>
      UnmodifiableListView(foodList);

  FavoriteFoodListViewModelImpl copyWith({
    List<Food>? foodList,
    bool? isLoading,
    bool? isError,
  }) {
    return FavoriteFoodListViewModelImpl(
      foodList: foodList ?? this.foodList,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
