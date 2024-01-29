import 'package:architecture_lints/lints/ui_imports_lint.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _ArchitectureLinter();

/// A plugin class is used to list all the assists/lints defined by a plugin.
class _ArchitectureLinter extends PluginBase {
  /// We list all the custom warnings/infos/errors
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const UiImportsLint(),
      ];
}
