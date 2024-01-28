import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/ui/pages/food_details_sheet/food_details_sheet.dart';
import 'package:appinio_bloc/ui/widgets/favorite_button.dart';
import 'package:appinio_bloc/ui/widgets/food_list_item.dart';
import 'package:appinio_bloc/ui/widgets/loading_placeholder.dart';
import 'package:appinio_bloc/ui/widgets/restaurant_header.dart';
import 'package:appinio_bloc/ui/widgets/search_persistent_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({
    required this.isLoading,
    required this.filteredFood,
    required this.onSearchChanged,
    required this.onFavoriteTap,
    super.key,
  });

  final bool isLoading;
  final UnmodifiableListView<Food> filteredFood;
  final ValueChanged<String> onSearchChanged;
  final void Function(Food) onFavoriteTap;

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  @override
  Widget build(BuildContext context) {
    final isLoading = widget.isLoading;
    final filteredFood = widget.filteredFood;
    if (filteredFood.isEmpty && isLoading) {
      return const LoadingPlaceholder();
    }
    return CustomScrollView(
      slivers: [
        const RestaurantHeader(),
        SearchPersistentHeader(
          onChanged: widget.onSearchChanged,
        ),
        SliverList.builder(
          itemBuilder: (context, i) => FoodListItem(
            title: filteredFood[i].name,
            price: filteredFood[i].price,
            image: NetworkImage(filteredFood[i].imageUrl),
            description: filteredFood[i].description,
            onTap: () => showFoodDetailsSheet(context, filteredFood[i]),
            onPriceTap: () {},
            subaction: FavoriteButton(
              onFavoriteTap: () => widget.onFavoriteTap(filteredFood[i]),
              isFavorite: filteredFood[i].isFavorite,
            ),
          ),
          itemCount: filteredFood.length,
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 124),
        ),
      ],
    );
  }
}
