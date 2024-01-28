import 'package:appinio_bloc/data/firestore_collections/firestore_order_collection.dart';

class FirestoreFoodInOrderDto {
  const FirestoreFoodInOrderDto({
    required this.foodId,
    required this.count,
  });

  factory FirestoreFoodInOrderDto.fromMap(Map<String, dynamic> map) {
    return FirestoreFoodInOrderDto(
      foodId: map[OrderCollection.food$foodId] as String,
      count: map[OrderCollection.food$count] as int,
    );
  }

  final String foodId;
  final int count;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      OrderCollection.food$foodId: foodId,
      OrderCollection.food$count: count,
    };
  }
}
