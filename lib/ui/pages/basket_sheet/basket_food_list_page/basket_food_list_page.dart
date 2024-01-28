import 'package:appinio_bloc/ui/pages/basket_sheet/basket_food_list_page/basket_food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_food_list_page/widgets/no_food_placeholder.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/routes.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/widgets/basket_sheet_content_decoration.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/widgets/basket_sheet_summary.dart';
import 'package:appinio_bloc/ui/widgets/food_counter.dart';
import 'package:appinio_bloc/ui/widgets/food_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketFoodListPage extends StatelessWidget {
  const BasketFoodListPage({super.key});

  void onNext(BuildContext context) =>
      Navigator.of(context).pushNamed(BasketRoutes.address);

  @override
  Widget build(BuildContext context) {
    final foodList = context.select(
      (BasketFoodListCubit cubit) => cubit.state.foodInBasket,
    );
    final totalPrice = context.select(
      (BasketFoodListCubit cubit) => cubit.state.totalPrice,
    );

    return BasketSheetContentDecoration(
      child: Column(
        children: [
          Expanded(
            child: foodList.isEmpty
                ? const NoFoodPlaceholder()
                : ListView.builder(
                    itemCount: foodList.length,
                    itemBuilder: (context, i) => FoodListItem(
                      image: NetworkImage(foodList[i].food.imageUrl),
                      title: foodList[i].food.name,
                      description: foodList[i].food.description,
                      price: foodList[i].food.price,
                      subaction: FoodCounter(
                        count: foodList[i].count,
                        onMinusTap: () => context
                            .read<BasketFoodListCubit>()
                            .onRemoveFood(foodList[i].food),
                        onPlusTap: () => context
                            .read<BasketFoodListCubit>()
                            .onAddFood(foodList[i].food),
                      ),
                    ),
                  ),
          ),
          BasketSheetSummary(
            totalPrice: totalPrice,
            buttonText: 'Next',
            onSubmit: foodList.isEmpty ? null : () => onNext(context),
          ),
        ],
      ),
    );
  }
}
