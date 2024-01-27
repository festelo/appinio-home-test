// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class Food extends Equatable {
  const Food({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isFavorite,
  });

  final String id;
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
}
