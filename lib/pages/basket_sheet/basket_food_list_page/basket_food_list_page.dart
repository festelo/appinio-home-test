import 'package:appinio_bloc/extensions/price_extensions.dart';
import 'package:appinio_bloc/pages/basket_sheet/basket_food_list_page/basket_food_list_cubit.dart';
import 'package:appinio_bloc/theme.dart';
import 'package:appinio_bloc/widgets/food_list_item.dart';
import 'package:appinio_bloc/widgets/sheet_handle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketFoodListPage extends StatelessWidget {
  const BasketFoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodList = context.select(
      (BasketFoodListCubit cubit) => cubit.state.foodInBasket,
    );
    final totalPrice = context.select(
      (BasketFoodListCubit cubit) => cubit.state.totalPrice,
    );

    return Column(
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
        Container(
          color: dividerColor,
          height: 1,
          width: double.infinity,
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 16),
            Text(
              'Delivery',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                'Free of charge',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 16),
            Text(
              'Total amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                totalPrice.formatAsPrice(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Next'),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
