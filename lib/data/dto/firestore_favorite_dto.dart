import 'package:appinio_bloc/data/firestore_collections/firestore_favorite_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFavoriteDto {
  const FirestoreFavoriteDto({
    required this.foodId,
    required this.userId,
  });

  factory FirestoreFavoriteDto.fromMap(Map<String, dynamic> map) {
    return FirestoreFavoriteDto(
      foodId: map[FavoritesCollection.foodId] as String,
      userId: map[FavoritesCollection.userId] as String,
    );
  }

  final String foodId;
  final String userId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FavoritesCollection.foodId: foodId,
      FavoritesCollection.userId: userId,
    };
  }
}

extension WithConverterFavoriteExtension on Query {
  Query<FirestoreFavoriteDto> withConverterAsFavorite() =>
      withConverter<FirestoreFavoriteDto>(
        fromFirestore: (s, _) => FirestoreFavoriteDto.fromMap(s.data() ?? {}),
        toFirestore: (s, _) => s.toMap(),
      );
}
