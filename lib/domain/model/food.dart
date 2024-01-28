import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

typedef FoodId = String;

class Food extends Equatable {
  const Food({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isFavorite,
  });

  final FoodId id;
  final String name;
  final String description;
  final String imageUrl;
  final Decimal price;
  final bool isFavorite;

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      price,
      isFavorite,
    ];
  }

  Food copyWith({
    FoodId? id,
    String? name,
    String? description,
    String? imageUrl,
    Decimal? price,
    bool? isFavorite,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
