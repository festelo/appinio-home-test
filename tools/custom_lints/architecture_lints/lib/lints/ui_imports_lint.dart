import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class UiImportsLint extends DartLintRule {
  const UiImportsLint() : super(code: _code);

  static const _code = LintCode(
    name: 'data_imports_forbidden_in_ui',
    problemMessage: 'Code from "data" layer should not be used in UI',
    errorSeverity: ErrorSeverity.WARNING,
  );

  static bool checkUriSegment(
    String? uri,
    String match, {
    required int segment,
  }) {
    if (uri == null) {
      return false;
    }

    final segments = uri.split('/');
    if (segments.length < segment + 1) {
      return false;
    }
    if (segments[segment] == match) {
      return true;
    }
    return false;
  }

  static bool isDataUri(String? uri) => //
      checkUriSegment(uri, 'data', segment: 1);

  static bool isUiUri(String? uri) => //
      checkUriSegment(uri, 'ui', segment: 1);

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final resolvedUnit = await resolver.getResolvedUnitResult();
    context.registry.addImportDirective((node) {
      if (isUiUri(resolvedUnit.uri.toString()) &&
          isDataUri(node.uri.stringValue)) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}
