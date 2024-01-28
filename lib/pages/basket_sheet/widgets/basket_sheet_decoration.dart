import 'package:flutter/cupertino.dart';

class BasketSheetDecoration extends StatelessWidget {
  const BasketSheetDecoration({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: child,
    );
  }
}
