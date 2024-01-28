import 'package:appinio_bloc/ui/extensions/price_extensions.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    required this.foodCount,
    required this.price,
    required this.onTap,
    super.key,
  });

  final int foodCount;
  final Decimal price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: orderButtonMainColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            width: double.infinity,
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
                  AppLocalizations.of(context)!.order_button_title,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
