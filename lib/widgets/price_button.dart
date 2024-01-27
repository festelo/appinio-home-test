// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appinio_bloc/extensions/price_extensions.dart';
import 'package:appinio_bloc/theme.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({
    required this.price,
    super.key,
  });

  final Decimal price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: priceBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      width: 60,
      alignment: Alignment.center,
      child: Text(
        price.formatAsPrice(),
        style: TextStyle(
          color: priceActionColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
