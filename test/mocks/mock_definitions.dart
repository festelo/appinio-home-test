import 'package:appinio_bloc/domain/repositories/basket_repository.dart';
import 'package:appinio_bloc/domain/repositories/food_repository.dart';
import 'package:appinio_bloc/domain/repositories/order_repository.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_cubit.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

class MockOrderRepository extends Mock implements OrderRepository {}

class MockBasketRepository extends Mock implements BasketRepository {}

class MockBasketAddressCubit extends Mock implements BasketAddressCubit {}

class MockBasketAddressViewModel extends Mock
    implements BasketAddressViewModel {}
