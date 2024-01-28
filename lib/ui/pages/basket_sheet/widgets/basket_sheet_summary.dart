import 'package:appinio_bloc/ui/extensions/price_extensions.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketSheetSummary extends StatelessWidget {
  const BasketSheetSummary({
    required this.totalPrice,
    required this.buttonText,
    required this.onSubmit,
    super.key,
  });

  final Decimal totalPrice;
  final String buttonText;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: dividerColor,
          height: 1,
          width: double.infinity,
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 16),
            Text(
              'Delivery',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                'Free of charge',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 16),
            const Text(
              'Total amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                totalPrice.formatAsPrice(),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              onPressed: onSubmit,
              disabledColor: orderButtonDisabledColor,
              child: Text(buttonText),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
