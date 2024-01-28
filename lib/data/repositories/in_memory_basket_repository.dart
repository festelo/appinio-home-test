import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:appinio_bloc/domain/repositories/basket_repository.dart';

class InMemoryBasketRepository implements BasketRepository {
  final Map<String, FoodInBasket> _storage = {};

  @override
  Future<void> add(Food food) async {
    if (_storage.containsKey(food.id)) {
      _storage[food.id] = _storage[food.id]!.copyWith(
        count: _storage[food.id]!.count + 1,
      );
    } else {
      _storage[food.id] = FoodInBasket(food: food, count: 1);
    }
  }

  @override
  Future<void> remove(Food food) async {
    if (!_storage.containsKey(food.id)) {
      return;
    }
    final newCount = _storage[food.id]!.count - 1;
    if (newCount == 0) {
      _storage.remove(food.id);
    } else {
      _storage[food.id] = _storage[food.id]!.copyWith(
        count: newCount,
      );
    }
  }

  @override
  Future<List<FoodInBasket>> list() async {
    return _storage.values.toList();
  }

  @override
  Future<void> clear() async {
    _storage.clear();
  }
}
