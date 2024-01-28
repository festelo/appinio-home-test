import 'package:appinio_bloc/ui/theme.dart';
import 'package:flutter/widgets.dart';

class NoFoodPlaceholder extends StatelessWidget {
  const NoFoodPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Text(
          'You have nothing in your basket',
          textAlign: TextAlign.center,
          style: titleThinTextStyle,
        ),
      ),
    );
  }
}
