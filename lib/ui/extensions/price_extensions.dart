import 'package:decimal/decimal.dart';

extension PriceExtensions on Decimal {
  String formatAsPrice() => '$this€';
}
