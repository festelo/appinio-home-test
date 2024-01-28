import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/stubs.dart';

Future<void> main() async {
  setUp(Mocks.init);

  test(
    'load() loads food from basket',
    () async {
      // GIVEN
      final cubit =
          BasketAddressCubit(Mocks.basketRepository, Mocks.orderRepository);

      when(Mocks.basketRepository.list)
          .thenAnswer((_) => Future.value(Stubs.foodInBasket));

      expect(cubit.state.foodInBasket, isEmpty);

      // WHEN
      await cubit.load();

      // THEN
      verify(Mocks.basketRepository.list);
      expect(cubit.state.foodInBasket, Stubs.foodInBasket);
    },
  );

  test(
    'onStreetChanged() changes street in the state',
    () async {
      // GIVEN
      final cubit =
          BasketAddressCubit(Mocks.basketRepository, Mocks.orderRepository);

      expect(cubit.state.street, isEmpty);
      const input = 'input';

      // WHEN
      cubit.onStreetChanged(input);

      // THEN
      expect(cubit.state.street, input);
    },
  );
}
