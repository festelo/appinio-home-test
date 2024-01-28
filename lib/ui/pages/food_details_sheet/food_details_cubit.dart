import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/repositories/basket_repository.dart';
import 'package:appinio_bloc/domain/repositories/food_repository.dart';
import 'package:appinio_bloc/ui/pages/food_details_sheet/food_details_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsViewModel> {
  FoodDetailsCubit(
    Food food,
    this._foodRepository,
    this._basketRepository,
  ) : super(FoodDetailsViewModel(food: food));

  final FoodRepository _foodRepository;
  final BasketRepository _basketRepository;

  Future<void> like() async {
    try {
      final food = state.food;
      await _foodRepository.like(food);
      emit(state.copyWith(food: food.copyWith(isFavorite: true)));
    } catch (e) {
      // todo: Display an error
      rethrow;
    }
  }

  Future<void> dislike() async {
    try {
      final food = state.food;
      await _foodRepository.dislike(food);
      emit(state.copyWith(food: food.copyWith(isFavorite: false)));
    } catch (e) {
      // todo: Display an error
      rethrow;
    }
  }

  Future<void> onFavoriteSwitched() async {
    final food = state.food;
    if (food.isFavorite) {
      await dislike();
    } else {
      await like();
    }
  }

  Future<void> onAddToBasket(Food food) async {
    await _basketRepository.add(food);
  }
}
