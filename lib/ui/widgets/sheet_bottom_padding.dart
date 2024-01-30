import 'dart:math';

import 'package:flutter/widgets.dart';

class SheetBottomPadding extends StatelessWidget {
  const SheetBottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: max(MediaQuery.of(context).viewPadding.bottom + 16, 32),
    );
  }
}
