import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

extension PriceExtensions on Decimal {
  String formatAsPrice() =>
      NumberFormat.currency(locale: 'de_DE', symbol: '€').format(toDouble());
}
