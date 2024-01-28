import 'package:appinio_bloc/theme.dart';
import 'package:flutter/cupertino.dart';

class FoodCounter extends StatelessWidget {
  const FoodCounter({
    required this.count,
    required this.onChange,
    super.key,
  });

  final int count;
  final ValueChanged<int> onChange;

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
            padding: EdgeInsets.zero,
            minSize: 28,
            child: Icon(
              CupertinoIcons.minus,
              size: 14,
              color: foodCounterCountColor,
            ),
            onPressed: () => onChange(count - 1),
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
            padding: EdgeInsets.zero,
            minSize: 28,
            child: Icon(
              CupertinoIcons.plus,
              size: 14,
              color: foodCounterCountColor,
            ),
            onPressed: () => onChange(count + 1),
          ),
        ],
      ),
    );
  }
}
