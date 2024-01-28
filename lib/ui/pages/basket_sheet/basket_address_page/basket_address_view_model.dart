import 'package:decimal/decimal.dart';

class BasketAddressViewModel {
  const BasketAddressViewModel();

  const BasketAddressViewModel.init();

  Decimal get totalPrice => Decimal.parse('123.32');

  BasketAddressViewModel copyWith() {
    return const BasketAddressViewModel();
  }
}
