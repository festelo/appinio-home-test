import 'package:flutter/cupertino.dart';

class BasketSheetContentDecoration extends StatelessWidget {
  const BasketSheetContentDecoration({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }
}
