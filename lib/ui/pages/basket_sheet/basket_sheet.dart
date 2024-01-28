import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_cubit.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_page.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_food_list_page/basket_food_list_cubit.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_food_list_page/basket_food_list_page.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_order_done_page/basket_order_done_page.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/routes.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/widgets/basket_sheet_decoration.dart';
import 'package:appinio_bloc/ui/widgets/sheet_handle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show showModalBottomSheet;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> showBasketSheet(BuildContext context) async {
  await showModalBottomSheet<bool?>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
    builder: (_) => SizedBox(
      height: MediaQuery.of(context).size.height - 50,
      child: const BasketSheet(),
    ),
  );
}

class BasketSheet extends StatelessWidget {
  const BasketSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasketSheetDecoration(
      child: Column(
        children: [
          const SheetHandle(),
          Expanded(
            child: Navigator(
              onGenerateRoute: (route) => switch (route.name) {
                BasketRoutes.done => CupertinoPageRoute(
                    settings: route,
                    builder: (context) => const BasketOrderDonePage(),
                  ),
                BasketRoutes.address => CupertinoPageRoute(
                    settings: route,
                    builder: (context) => BlocProvider(
                      create: (ctx) => BasketAddressCubit()..load(),
                      child: const BasketAddressPage(),
                    ),
                  ),
                BasketRoutes.foodList || _ => CupertinoPageRoute(
                    fullscreenDialog: true,
                    settings: route,
                    builder: (context) => BlocProvider(
                      create: (ctx) =>
                          BasketFoodListCubit(context.read())..load(),
                      child: const BasketFoodListPage(),
                    ),
                  ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
