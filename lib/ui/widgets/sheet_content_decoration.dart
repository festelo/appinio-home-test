import 'package:flutter/cupertino.dart';

class SheetContentDecoration extends StatelessWidget {
  const SheetContentDecoration({
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
