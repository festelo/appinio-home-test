import 'package:appinio_bloc/pages/food_list_page/favorite_food_list_tab/favorite_food_list_cubit.dart';
import 'package:appinio_bloc/theme.dart';
import 'package:appinio_bloc/widgets/food_list_item.dart';
import 'package:appinio_bloc/widgets/loading_placeholder.dart';
import 'package:appinio_bloc/widgets/restaurant_header.dart';
import 'package:appinio_bloc/widgets/search_persistent_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteFoodListTab extends StatefulWidget {
  const FavoriteFoodListTab({
    super.key,
  });

  @override
  State<FavoriteFoodListTab> createState() => _FavoriteFoodListTabState();
}

class _FavoriteFoodListTabState extends State<FavoriteFoodListTab> {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (FavoriteFoodListCubit cubit) => cubit.state.isLoading,
    );
    final filteredFoods = context.select(
      (FavoriteFoodListCubit cubit) => cubit.state.filteredFoods,
    );
    if (filteredFoods.isEmpty && isLoading) {
      return const LoadingPlaceholder();
    }
    return CustomScrollView(
      slivers: [
        RestaurantHeader(),
        SearchPersistentHeader(),
        SliverList.builder(
          itemBuilder: (context, i) => FoodListItem(
            title: filteredFoods[i].name,
            isFavorite: filteredFoods[i].isFavorite,
            price: filteredFoods[i].price,
            image: NetworkImage(filteredFoods[i].imageUrl),
            description: filteredFoods[i].description,
          ),
          itemCount: filteredFoods.length,
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 64),
        )
      ],
    );
  }
}
