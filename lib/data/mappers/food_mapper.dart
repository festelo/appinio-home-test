import 'package:appinio_bloc/data/dto/firestore_food_dto.dart';
import 'package:appinio_bloc/domain/model/food.dart';
import 'package:decimal/decimal.dart';

Food mapFoodDtoToDomain(FirestoreFoodDto dto, {required bool isFavorite}) {
  return Food(
    id: dto.id,
    name: dto.name,
    description: dto.description,
    imageUrl: dto.imageUrl,
    price: Decimal.parse(dto.price),
    isFavorite: isFavorite,
  );
}
