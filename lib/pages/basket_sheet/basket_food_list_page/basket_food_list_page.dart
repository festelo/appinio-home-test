import 'package:appinio_bloc/pages/basket_sheet/basket_food_list_page/basket_food_list_cubit.dart';
import 'package:appinio_bloc/pages/basket_sheet/routes.dart';
import 'package:appinio_bloc/pages/basket_sheet/widgets/basket_sheet_decoration.dart';
import 'package:appinio_bloc/pages/basket_sheet/widgets/basket_sheet_summary.dart';
import 'package:appinio_bloc/theme.dart';
import 'package:appinio_bloc/widgets/food_list_item.dart';
import 'package:appinio_bloc/widgets/sheet_handle.dart';
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

    return BasketSheetDecoration(
      child: Column(
        children: [
          const SheetHandle(),
          Expanded(
            child: ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, i) => FoodListItem(
                image: NetworkImage(foodList[i].food.imageUrl),
                title: foodList[i].food.name,
                description: foodList[i].food.description,
                price: foodList[i].food.price,
                onTap: () {},
                subaction: Container(
                  decoration: BoxDecoration(
                    color: foodCounterBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 28,
                        child: Icon(
                          CupertinoIcons.minus,
                          size: 14,
                          color: foodCounterCountColor,
                        ),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          foodList[i].count.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: foodCounterCountColor,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 28,
                        child: Icon(
                          CupertinoIcons.plus,
                          size: 14,
                          color: foodCounterCountColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BasketSheetSummary(
            totalPrice: totalPrice,
            buttonText: 'Next',
            onSubmit: () => onNext(context),
          ),
        ],
      ),
    );
  }
}
