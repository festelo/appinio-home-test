import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/ui/extensions/price_extensions.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showFoodDetailsSheet(BuildContext context, Food food) async {
  final res = await showModalBottomSheet<bool?>(
    context: context,
    isScrollControlled: true,
    backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
    builder: (_) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: FoodDetailsSheet(food: food),
    ),
  );
  return res ?? false;
}

class FoodDetailsSheet extends StatelessWidget {
  const FoodDetailsSheet({
    required this.food,
    super.key,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 16),
              Image.network(
                food.imageUrl,
                height: 200,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        food.name,
                        style: titleTextStyle,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    child: food.isFavorite
                        ? Icon(
                            CupertinoIcons.heart_fill,
                            color: favoriteColor,
                            size: 24,
                          )
                        : Icon(
                            CupertinoIcons.heart,
                            color: notFavoriteColor,
                            size: 24,
                          ),
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                food.description,
                style: regularTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CupertinoButton.filled(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Add to basket for ${food.price.formatAsPrice()}'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
