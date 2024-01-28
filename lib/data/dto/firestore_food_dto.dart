import 'package:appinio_bloc/data/firestore_collections/firestore_food_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFoodDto {
  const FirestoreFoodDto({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  factory FirestoreFoodDto.fromMap(String id, Map<String, dynamic> map) {
    return FirestoreFoodDto(
      id: id,
      name: map[FoodCollection.name] as String,
      description: map[FoodCollection.description] as String,
      imageUrl: map[FoodCollection.imageUrl] as String,
      price: map[FoodCollection.price] as String,
    );
  }

  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String price;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}

extension WithConverterFoodExtension on Query {
  Query<FirestoreFoodDto> withConverterAsFood() =>
      withConverter<FirestoreFoodDto>(
        fromFirestore: (s, _) => FirestoreFoodDto.fromMap(s.id, s.data() ?? {}),
        toFirestore: (s, _) => s.toMap(),
      );
}
