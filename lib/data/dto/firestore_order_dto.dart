import 'package:appinio_bloc/data/dto/firestore_food_in_order_dto.dart';
import 'package:appinio_bloc/data/firestore_collections/firestore_order_collection.dart';

class FirestoreOrderDto {
  const FirestoreOrderDto({
    required this.street,
    required this.floor,
    required this.comment,
    required this.food,
  });

  factory FirestoreOrderDto.fromMap(Map<String, dynamic> map) {
    return FirestoreOrderDto(
      street: map[OrderCollection.street] as String,
      floor: map[OrderCollection.floor] as String,
      comment: map[OrderCollection.comment] as String,
      food: List<FirestoreFoodInOrderDto>.from(
        (map[OrderCollection.food] as List<int>).map<FirestoreFoodInOrderDto>(
          (x) => FirestoreFoodInOrderDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
  final String street;
  final String floor;
  final String comment;
  final List<FirestoreFoodInOrderDto> food;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      OrderCollection.street: street,
      OrderCollection.floor: floor,
      OrderCollection.comment: comment,
      OrderCollection.food: food.map((x) => x.toMap()).toList(),
    };
  }
}
