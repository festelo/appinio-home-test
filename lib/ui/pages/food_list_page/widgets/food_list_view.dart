import 'dart:collection';

import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/widgets/empty_placeholder.dart';
import 'package:appinio_bloc/ui/widgets/favorite_button.dart';
import 'package:appinio_bloc/ui/widgets/food_list_item.dart';
import 'package:appinio_bloc/ui/widgets/loading_placeholder.dart';
import 'package:appinio_bloc/ui/widgets/restaurant_header.dart';
import 'package:appinio_bloc/ui/widgets/search_persistent_header.dart';
import 'package:flutter/cupertino.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({
    required this.isLoading,
    required this.filteredFood,
    required this.onSearchChanged,
    required this.onFavoriteTap,
    required this.onAddToBasket,
    required this.onFoodTap,
    required this.onRefresh,
    super.key,
  });

  final bool isLoading;
  final UnmodifiableListView<Food> filteredFood;
  final ValueChanged<String> onSearchChanged;
  final void Function(Food) onFavoriteTap;
  final void Function(Food) onAddToBasket;
  final void Function(Food) onFoodTap;
  final Future<void> Function() onRefresh;

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
        CupertinoSliverRefreshControl(
          onRefresh: widget.onRefresh,
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 16),
        ),
        if (filteredFood.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: EmptyPlaceholder(),
          )
        else
          SliverList.builder(
            itemBuilder: (context, i) => FoodListItem(
              title: filteredFood[i].name,
              price: filteredFood[i].price,
              image: NetworkImage(filteredFood[i].imageUrl),
              description: filteredFood[i].description,
              onTap: () => widget.onFoodTap(filteredFood[i]),
              onPriceTap: () => widget.onAddToBasket(filteredFood[i]),
              subaction: FavoriteButton(
                onFavoriteTap: () => widget.onFavoriteTap(filteredFood[i]),
                isFavorite: filteredFood[i].isFavorite,
              ),
            ),
            itemCount: filteredFood.length,
          ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 80),
        ),
      ],
    );
  }
}
