import 'package:appinio_bloc/ui/pages/basket_sheet/basket_sheet.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/food_list_page/widgets/food_list_view.dart';
import 'package:appinio_bloc/ui/widgets/order_button.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  void onOpenBasket(BuildContext context) => showBasketSheet(context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoPageScaffold(
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
        Positioned(
          bottom: 74,
          left: 0,
          right: 0,
          child: OrderButton(
            foodCount: 2,
            price: Decimal.parse('12.34'),
            onTap: () => onOpenBasket(context),
          ),
        ),
      ],
    );
  }
}
