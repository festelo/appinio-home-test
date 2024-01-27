import 'package:appinio_bloc/extensions/price_extensions.dart';
import 'package:appinio_bloc/theme.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    required this.foodCount,
    required this.price,
    super.key,
  });

  final int foodCount;
  final Decimal price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: orderButtonMainColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 7,
              right: 7,
              bottom: 3,
              top: 2,
            ),
            margin: const EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              foodCount.toString(),
              style: TextStyle(
                fontSize: 12,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: orderButtonMainColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'View order',
            style: TextStyle(
              color: orderButtonTextColor,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              price.formatAsPrice(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: orderButtonTextColor,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
