import 'package:appinio_bloc/ui/theme.dart';
import 'package:flutter/material.dart';

class FoodImagePlaceholder extends StatelessWidget {
  const FoodImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: placeholderImageColor,
          ),
          width: 110,
          height: 110,
          child: const Icon(
            Icons.image_outlined,
            size: 36,
          ),
        ),
      ),
    );
  }
}
