// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appinio_bloc/ui/extensions/price_extensions.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({
    required this.price,
    required this.onTap,
    super.key,
  });

  final Decimal price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
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
        ),
      ),
    );
  }
}
