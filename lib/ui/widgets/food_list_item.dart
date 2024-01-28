import 'package:appinio_bloc/ui/theme.dart';
import 'package:appinio_bloc/ui/widgets/price_button.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.onTap,
    this.onPriceTap,
    this.subaction,
    super.key,
  });

  final ImageProvider image;
  final String title;
  final String description;
  final Decimal price;

  final VoidCallback? onPriceTap;
  final VoidCallback? onTap;
  final Widget? subaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image(
                image: image,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: titleTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: regularTextStyle,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: PriceButton(
                            price: price,
                            onTap: onPriceTap,
                          ),
                        ),
                      ),
                      if (subaction != null) subaction!,
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
