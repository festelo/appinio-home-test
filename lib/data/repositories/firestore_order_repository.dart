import 'package:appinio_bloc/data/constants.dart';
import 'package:appinio_bloc/data/dto/firestore_food_in_order_dto.dart';
import 'package:appinio_bloc/data/dto/firestore_order_dto.dart';
import 'package:appinio_bloc/data/firestore_collections/firestore_order_collection.dart';
import 'package:appinio_bloc/domain/model/food_in_basket.dart';
import 'package:appinio_bloc/domain/repositories/order_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreOrderRepository implements OrderRepository {
  FirestoreOrderRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<void> order({
    required List<FoodInBasket> foodInBasket,
    required String street,
    required String floor,
    required String comment,
  }) async {
    await _firestore.collection(OrderCollection.collectionName).add(
          FirestoreOrderDto(
            street: street,
            floor: floor,
            comment: comment,
            userId: userId,
            food: foodInBasket
                .map(
                  (f) => FirestoreFoodInOrderDto(
                    foodId: f.food.id,
                    count: f.count,
                  ),
                )
                .toList(),
          ).toMap(),
        );
  }
}
