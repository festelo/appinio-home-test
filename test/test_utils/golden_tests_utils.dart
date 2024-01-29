import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

const pageSizes = {
  'iPhone SE': Size(375, 667),
  'iPhone Pro': Size(390, 844),
  'iPhone Pro Max': Size(428, 926),
};

@isTest
Future<void> widgetScreenshotTest(
  String description, {
  required WidgetBuilder widgetBuilder,
  String variantName = '',
  bool skip = false,
  List<String> tags = const ['golden'],
  Duration timeout = const Duration(seconds: 5),
  VoidCallback? setUp,
  Map<String, Size> sizes = const {},
}) async {
  return goldenTest(
    description,
    fileName:
        "$description${variantName.trim().isEmpty ? '' : '_$variantName'}",
    builder: () {
      setUp?.call();
      return GoldenTestGroup(
        columns: sizes.isEmpty ? 1 : sizes.length,
        children: [
          for (final size in sizes.entries)
            GoldenTestScenario(
              name: size.key,
              constraints: BoxConstraints.expand(
                width: size.value.width,
                height: size.value.height,
              ),
              child: Builder(builder: widgetBuilder),
            ),
          if (sizes.isEmpty)
            GoldenTestScenario(
              name: 'default',
              child: Builder(builder: widgetBuilder),
            )
        ],
      );
    },
    tags: tags,
    skip: skip,
    pumpBeforeTest: (tester) async {
      // this will allow all the UI to properly settle before caching images
      await tester.pump(const Duration(milliseconds: 500));
    },
  ).timeout(timeout);
}
