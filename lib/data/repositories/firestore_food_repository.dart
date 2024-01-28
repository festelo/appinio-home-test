import 'package:appinio_bloc/data/constants.dart';
import 'package:appinio_bloc/data/dto/firestore_favorite_dto.dart';
import 'package:appinio_bloc/data/dto/firestore_food_dto.dart';
import 'package:appinio_bloc/data/firestore_collections/firestore_favorite_collection.dart';
import 'package:appinio_bloc/data/firestore_collections/firestore_food_collection.dart';
import 'package:appinio_bloc/data/mappers/food_mapper.dart';
import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/domain/repositories/food_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFoodRepository implements FoodRepository {
  FirestoreFoodRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<List<Food>> list() async {
    final foodSnapshots = await _firestore
        .collection(FoodCollection.collectionName)
        .withConverterAsFood()
        .get();

    final userFavoritesSnapshots = await _firestore
        .collection(FavoritesCollection.collectionName)
        .where(FavoritesCollection.userId, isEqualTo: userId)
        .withConverterAsFavorite()
        .get();

    final userFavorites =
        userFavoritesSnapshots.docs.map((e) => e.data().foodId).toSet();

    return foodSnapshots.docs
        .map(
          (s) => mapFoodDtoToDomain(
            s.data(),
            isFavorite: userFavorites.contains(s.id),
          ),
        )
        .toList();
  }

  @override
  Future<void> dislike(Food food) async {
    final batch = FirebaseFirestore.instance.batch();
    final likeEntities = await _firestore
        .collection(FavoritesCollection.collectionName)
        .where(FavoritesCollection.foodId, isEqualTo: food.id)
        .where(FavoritesCollection.userId, isEqualTo: userId)
        .get();
    for (final entity in likeEntities.docs) {
      batch.delete(entity.reference);
    }
    await batch.commit();
  }

  @override
  Future<void> like(Food food) async {
    final existedLikesForThisFoodCount = await _firestore
        .collection(FavoritesCollection.collectionName)
        .where(FavoritesCollection.foodId, isEqualTo: food.id)
        .where(FavoritesCollection.userId, isEqualTo: userId)
        .count()
        .get()
        .then((v) => v.count ?? 0);

    if (existedLikesForThisFoodCount > 0) {
      return;
    }

    await _firestore.collection(FavoritesCollection.collectionName).add(
          FirestoreFavoriteDto(foodId: food.id, userId: userId).toMap(),
        );
  }
}
