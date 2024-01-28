import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/pages/food_details_sheet/food_details_sheet.dart';
import 'package:appinio_bloc/widgets/food_list_item.dart';
import 'package:appinio_bloc/widgets/loading_placeholder.dart';
import 'package:appinio_bloc/widgets/restaurant_header.dart';
import 'package:appinio_bloc/widgets/search_persistent_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({
    required this.isLoading,
    required this.filteredFoods,
    super.key,
  });

  final bool isLoading;
  final UnmodifiableListView<Food> filteredFoods;

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  @override
  Widget build(BuildContext context) {
    final isLoading = widget.isLoading;
    final filteredFoods = widget.filteredFoods;
    if (filteredFoods.isEmpty && isLoading) {
      return const LoadingPlaceholder();
    }
    return CustomScrollView(
      slivers: [
        const RestaurantHeader(),
        const SearchPersistentHeader(),
        SliverList.builder(
          itemBuilder: (context, i) => FoodListItem(
            title: filteredFoods[i].name,
            isFavorite: filteredFoods[i].isFavorite,
            price: filteredFoods[i].price,
            image: NetworkImage(filteredFoods[i].imageUrl),
            description: filteredFoods[i].description,
            onTap: () => showFoodDetailsSheet(context, filteredFoods[i]),
            onPriceTap: () {},
            onFavoriteTap: () {},
          ),
          itemCount: filteredFoods.length,
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 124),
        ),
      ],
    );
  }
}
