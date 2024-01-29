import 'package:mocktail/mocktail.dart';

import 'mock_definitions.dart';

class Mocks {
  static final MockFoodRepository foodRepository = MockFoodRepository();
  static final MockOrderRepository orderRepository = MockOrderRepository();
  static final MockBasketRepository basketRepository = MockBasketRepository();
  static final MockBasketAddressCubit basketAddressCubit =
      MockBasketAddressCubit();

  static void init() {
    // this fallback value isn't used, just an example
    registerFallbackValue(MockBasketAddressViewModel());
  }
}
