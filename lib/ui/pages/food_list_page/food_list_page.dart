import 'package:appinio_bloc/domain/model/food.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_sheet.dart';
import 'package:appinio_bloc/ui/pages/food_details_sheet/food_details_sheet.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/widgets/food_list_view.dart';
import 'package:appinio_bloc/ui/widgets/order_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  Future<void> onOpenBasket(BuildContext context) async {
    final loadBasket = context.read<FoodListCubit>().loadBasket;
    await showBasketSheet(context);
    await loadBasket();
  }

  Future<void> onFoodTap(BuildContext context, Food food) async {
    final onAddToBasket = context.read<FoodListCubit>().onAddToBasket;
    final onFoodChanged = context.read<FoodListCubit>().onFoodChanged;
    final result = await showFoodDetailsSheet(context, food);
    onFoodChanged(oldFood: food, newFood: result.food);
    if (result.wasAddedToBasket) {
      await onAddToBasket(food);
    }
  }

  @override
  Widget build(BuildContext context) {
    final basketFoodCount = context.select(
      (FoodListCubit cubit) => cubit.state.basketFoodCount,
    );

    return Stack(
      children: [
        SafeArea(
          child: CupertinoPageScaffold(
            child: Column(
              children: [
                Expanded(
                  child: FoodListView(
                    isLoading: context.select(
                      (FoodListCubit cubit) => cubit.state.isLoading,
                    ),
                    filteredFood: context.select(
                      (FoodListCubit cubit) => cubit.state.filteredFoodList,
                    ),
                    onSearchChanged:
                        context.read<FoodListCubit>().changeSearchPhrase,
                    onFavoriteTap:
                        context.read<FoodListCubit>().onFavoriteSwitched,
                    onAddToBasket: context.read<FoodListCubit>().onAddToBasket,
                    onRefresh: context.read<FoodListCubit>().load,
                    onFoodTap: (f) => onFoodTap(context, f),
                  ),
                ),
                CupertinoTabBar(
                  onTap: (i) =>
                      context.read<FoodListCubit>().changeFilterBasedOnTab(i),
                  currentIndex: context.select(
                    (FoodListCubit cubit) => cubit.state.currentTab,
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.list_bullet),
                      label: 'Overview',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.heart),
                      label: 'Favorites',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (basketFoodCount != 0)
          Positioned(
            bottom: 74,
            left: 0,
            right: 0,
            child: OrderButton(
              foodCount: basketFoodCount,
              price: context.select(
                (FoodListCubit cubit) => cubit.state.basketTotalPrice,
              ),
              onTap: () => onOpenBasket(context),
            ),
          ),
      ],
    );
  }
}
