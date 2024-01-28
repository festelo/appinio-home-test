import 'package:appinio_bloc/pages/basket_sheet/basket_food_list_page/basket_food_list_cubit.dart';
import 'package:appinio_bloc/pages/basket_sheet/basket_food_list_page/basket_food_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, showModalBottomSheet;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<bool> showBasketSheet(BuildContext context) async {
  final res = await showModalBottomSheet<bool?>(
    context: context,
    isScrollControlled: true,
    backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
    builder: (_) => SizedBox(
      child: BasketSheet(),
    ),
  );
  return res ?? false;
}

class BasketSheet extends StatelessWidget {
  const BasketSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (route) => CupertinoPageRoute(
        fullscreenDialog: true,
        settings: route,
        builder: (context) => BlocProvider(
          create: (ctx) => BasketFoodListCubit()..load(),
          child: const BasketFoodListPage(),
        ),
      ),
    );
  }
}
