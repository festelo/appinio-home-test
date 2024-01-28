import 'package:appinio_bloc/domain/model/food.dart';
import 'package:equatable/equatable.dart';

class FoodDetailsViewModel extends Equatable {
  const FoodDetailsViewModel({
    required this.food,
  });

  final Food food;

  @override
  List<Object?> get props => [food];

  FoodDetailsViewModel copyWith({Food? food}) {
    return FoodDetailsViewModel(
      food: food ?? this.food,
    );
  }
}
