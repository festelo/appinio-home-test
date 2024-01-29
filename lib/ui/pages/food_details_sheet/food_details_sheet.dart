import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/ui/extensions/price_extensions.dart';
import 'package:appinio_bloc/ui/pages/food_details_sheet/food_details_cubit.dart';
import 'package:appinio_bloc/ui/pages/food_details_sheet/food_details_result.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:appinio_bloc/ui/widgets/draggable_scrollable_sheet_wrapper.dart';
import 'package:appinio_bloc/ui/widgets/sheet_decoration.dart';
import 'package:appinio_bloc/ui/widgets/sheet_handle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<FoodDetailsResult> showFoodDetailsSheet(
  BuildContext context,
  Food food,
) async {
  final foodDetailsCubit = FoodDetailsCubit(
    food,
    context.read(),
    context.read(),
  );
  final res = await showModalBottomSheet<bool?>(
    context: context,
    isScrollControlled: true,
    backgroundColor: transparentColor,
    useSafeArea: true,
    builder: (_) => DraggableScrollabeSheetWrapper(
      height: 525,
      minSize: 200,
      builder: (context, scrollController) => BlocProvider.value(
        value: foodDetailsCubit,
        child: FoodDetailsSheet(scrollController: scrollController),
      ),
    ),
  );
  await foodDetailsCubit.close();
  return FoodDetailsResult(
    food: foodDetailsCubit.state.food,
    wasAddedToBasket: res ?? false,
  );
}

class FoodDetailsSheet extends StatelessWidget {
  const FoodDetailsSheet({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  Future<void> _onLikeTap(BuildContext context) async {
    await context.read<FoodDetailsCubit>().onFavoriteSwitched();
  }

  @override
  Widget build(BuildContext context) {
    final food = context.select((FoodDetailsCubit cubit) => cubit.state.food);
    return SheetDecoration(
      child: Column(
        children: [
          const SheetHandle(),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
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
                      onPressed: () => _onLikeTap(context),
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
      ),
    );
  }
}
