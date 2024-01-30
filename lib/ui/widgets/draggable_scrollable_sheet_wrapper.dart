import 'dart:math';

import 'package:appinio_bloc/ui/widgets/draggable_scrollable_sheet.dart';
import 'package:flutter/widgets.dart' hide DraggableScrollableSheet;

class DraggableScrollabeSheetWrapper extends StatelessWidget {
  const DraggableScrollabeSheetWrapper({
    required this.builder,
    required this.minSize,
    required this.height,
    super.key,
  });

  final ScrollableWidgetBuilder builder;
  final double Function(BoxConstraints constraints) minSize;
  final double Function(BoxConstraints constraints) height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final height = this.height(constraints);
            final minSize = this.minSize(constraints);

            final maxSizeInPixels = min(height, constraints.maxHeight);
            final targetMinSizeInPixels = min(maxSizeInPixels - 1, minSize);

            return DraggableScrollableSheet(
              initialChildSize: maxSizeInPixels / constraints.maxHeight,
              maxChildSize: maxSizeInPixels / constraints.maxHeight,
              minChildSize: targetMinSizeInPixels / constraints.maxHeight,
              snap: true,
              snapSizes: [(targetMinSizeInPixels - 1) / constraints.maxHeight],
              builder: builder,
            );
          },
        ),
      ],
    );
  }
}
