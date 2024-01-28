import 'package:appinio_bloc/ui/theme.dart';
import 'package:flutter/cupertino.dart';

class FoodCounter extends StatelessWidget {
  const FoodCounter({
    required this.count,
    required this.onMinusTap,
    required this.onPlusTap,
    super.key,
  });

  final int count;
  final VoidCallback onMinusTap;
  final VoidCallback onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: foodCounterBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            minSize: 28,
            onPressed: onMinusTap,
            child: Icon(
              CupertinoIcons.minus,
              size: 14,
              color: foodCounterCountColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 14,
                color: foodCounterCountColor,
              ),
            ),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            minSize: 28,
            onPressed: onPlusTap,
            child: Icon(
              CupertinoIcons.plus,
              size: 14,
              color: foodCounterCountColor,
            ),
          ),
        ],
      ),
    );
  }
}
