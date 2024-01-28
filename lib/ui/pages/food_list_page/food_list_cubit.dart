import 'dart:collection';

import 'package:appinio_bloc/domain/extensions/food_in_basket.dart';
import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/repositories/basket_repository.dart';
import 'package:appinio_bloc/domain/repositories/food_repository.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListCubit extends Cubit<FoodListViewModel> {
  FoodListCubit(
    this._foodRepository,
    this._basketRepository,
  ) : super(FoodListViewModel.init());

  final FoodRepository _foodRepository;
  final BasketRepository _basketRepository;

  Future<void> load() async {
    try {
      await loadFood();
      await loadBasket();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> loadBasket() async {
    try {
      final basketList = await _basketRepository.list();
      emit(
        state.copyWith(
          basketFoodCount: basketList.totalCount,
          basketTotalPrice: basketList.totalPrice,
        ),
      );
    } catch (e) {
      // todo: Display an error
      rethrow;
    }
  }

  Future<void> loadFood() async {
    try {
      final foodList = await _foodRepository.list();
      emit(
        state.copyWith(
          foodList: UnmodifiableListView(foodList),
        ),
      );
      applySearchAndFilter();
    } catch (e) {
      // todo: Display an error
      rethrow;
    }
  }

  Future<void> like(Food food) async {
    try {
      await _foodRepository.like(food);
      emit(state.copyWithFoodFavorite(food, isFavorite: true));
      applySearchAndFilter();
    } catch (e) {
      // todo: Display an error
      rethrow;
    }
  }

  Future<void> dislike(Food food) async {
    try {
      await _foodRepository.dislike(food);
      emit(state.copyWithFoodFavorite(food, isFavorite: false));
      applySearchAndFilter();
    } catch (e) {
      // todo: Display an error
      rethrow;
    }
  }

  Future<void> onFavoriteSwitched(Food food) async {
    if (food.isFavorite) {
      await dislike(food);
    } else {
      await like(food);
    }
  }

  void changeFilter(FoodFilter filter) {
    emit(
      state.copyWith(filter: filter),
    );
    applySearchAndFilter();
  }

  void changeFilterBasedOnTab(int tab) {
    changeFilter(
      switch (tab) {
        1 => FoodFilter.favorite,
        _ => FoodFilter.all,
      },
    );
  }

  void changeSearchPhrase(String searchPhrase) {
    emit(
      state.copyWith(searchPhrase: searchPhrase),
    );
    applySearchAndFilter();
  }

  void applySearchAndFilter() {
    final searchPhrase = state.searchPhrase.toLowerCase();
    final filter = state.filter;

    final foundWithoutSearch = <Food>[];
    final foundByNameFood = <Food>[];
    final foundByDescriptionFood = <Food>[];

    final shouldBeSearched = searchPhrase.trim().isNotEmpty;

    if (!shouldBeSearched && filter == FoodFilter.all) {
      emit(state.copyWith(filteredFoodList: state.foodList));
    }

    for (final food in state.foodList) {
      if (filter == FoodFilter.favorite && !food.isFavorite) {
        continue;
      }

      if (!shouldBeSearched) {
        foundWithoutSearch.add(food);
        continue;
      }

      final foundByName = food.name.toLowerCase().contains(searchPhrase);
      if (foundByName) {
        foundByNameFood.add(food);
        continue;
      }

      final foundByDescription =
          food.description.toLowerCase().contains(searchPhrase);
      if (foundByDescription) {
        foundByDescriptionFood.add(food);
      }
    }

    final foundFood = UnmodifiableListView([
      ...foundWithoutSearch,
      ...foundByNameFood,
      ...foundByDescriptionFood,
    ]);

    emit(state.copyWith(filteredFoodList: foundFood));
  }

  Future<void> onAddToBasket(Food food) async {
    await _basketRepository.add(food);
    emit(
      state.copyWith(
        basketFoodCount: state.basketFoodCount + 1,
        basketTotalPrice: state.basketTotalPrice + food.price,
      ),
    );
  }
}
