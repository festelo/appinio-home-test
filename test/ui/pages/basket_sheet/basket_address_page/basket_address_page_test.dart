import 'dart:collection';

import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_cubit.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_page.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_view_model.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/stubs.dart';
import '../../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  await widgetScreenshotTest(
    'basket_address_page',
    setUp: () {
      final vm = BasketAddressViewModel(
        foodInBasket: UnmodifiableListView(Stubs.foodInBasket),
        totalPrice: Decimal.parse('12.34'),
        street: 'Hauptstr. 23',
        floor: '',
        comment: '',
      );

      when(() => Mocks.basketAddressCubit.state) //
          .thenReturn(vm);

      when(() => Mocks.basketAddressCubit.stream)
          .thenAnswer((_) => Stream.value(vm));
    },
    sizes: pageSizes,
    widgetBuilder: (context) => BlocProvider<BasketAddressCubit>.value(
      value: Mocks.basketAddressCubit,
      child: BasketAddressPage(
        scrollController: ScrollController(),
      ),
    ),
  );
}
