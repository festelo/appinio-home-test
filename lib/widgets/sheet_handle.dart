import 'package:appinio_bloc/theme.dart';
import 'package:flutter/cupertino.dart';

class SheetHandle extends StatelessWidget {
  const SheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Center(
          child: Container(
            width: 64,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: sheetHandleColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
