import 'package:appinio_bloc/ui/theme.dart';
import 'package:flutter/widgets.dart';

class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sorry, it seems empty here',
        textAlign: TextAlign.center,
        style: titleThinTextStyle,
      ),
    );
  }
}
