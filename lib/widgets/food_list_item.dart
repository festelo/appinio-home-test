import 'package:appinio_bloc/theme.dart';
import 'package:appinio_bloc/widgets/price_button.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    required this.title,
    required this.isFavorite,
    required this.price,
    required this.image,
    required this.description,
    super.key,
  });

  final ImageProvider image;
  final String title;
  final String description;
  final Decimal price;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image(
              image: image,
              height: 120,
              width: 120,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: PriceButton(price: price),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: isFavorite
                          ? Icon(
                              CupertinoIcons.heart_fill,
                              color: favoriteColor,
                              size: 22,
                            )
                          : Icon(
                              CupertinoIcons.heart,
                              color: notFavoriteColor,
                              size: 22,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
