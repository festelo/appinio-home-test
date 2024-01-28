import 'package:appinio_bloc/pages/food_list_page/food_list_cubit.dart';
import 'package:appinio_bloc/pages/food_list_page/food_list_view_model.dart';
import 'package:appinio_bloc/pages/food_list_page/widgets/food_list_view.dart';
import 'package:appinio_bloc/widgets/order_button.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

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
                  filteredFoods: context.select(
                    (FoodListCubit cubit) => cubit.state.filteredFoods,
                  ),
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
          child: OrderButton(
            foodCount: 2,
            price: Decimal.parse('12.34'),
          ),
          bottom: 74,
          left: 0,
          right: 0,
        ),
      ],
    );
  }
}
