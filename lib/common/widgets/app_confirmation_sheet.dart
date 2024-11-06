import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../translations/locale_keys.g.dart';
import '../haptic_provider.dart';
import 'app_bottom_sheet.dart';
import 'button/app_large_gradient_button.dart';
import 'button/app_underline_button.dart';

class AppConfirmationSheet extends ConsumerWidget {
  const AppConfirmationSheet({
    super.key,
    required this.description,
    required this.positiveTitle,
    required this.negativeTitle,
    this.inverted = false,
    this.underlineColor,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String description,
    required String positiveTitle,
    required String negativeTitle,
    bool inverted = false,
    Color? underlineColor,
  }) {
    return showAppModalBottomSheet<bool?>(
      context: context,
      builder: (_) => AppConfirmationSheet(
        description: description,
        positiveTitle: positiveTitle,
        negativeTitle: negativeTitle,
        inverted: inverted,
        underlineColor: underlineColor,
      ),
    );
  }

  final String description;
  final String positiveTitle;
  final String negativeTitle;
  final Color? underlineColor;

  /// By default, gradient button is positive and underline button is negative.
  /// If `inverted` is true, gradient button is negative and underline button is positive.
  final bool inverted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDefault = !inverted;

    return AppBottomSheet(
      title: tr(LocaleKeys.common_are_you_sure),
      description: description,
      actions: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppLargeGradientButton(
            title: isDefault ? positiveTitle : negativeTitle,
            onPressed: () {
              ref.feedbackLight();
              // ignore: avoid_bool_literals_in_conditional_expressions
              Navigator.of(context).pop(isDefault ? true : false);
            },
          ),
          const SizedBox(height: 16),
          AppUnderlineButton(
            title: isDefault ? negativeTitle : positiveTitle,
            color: underlineColor,
            onPressed: () {
              ref.feedbackLight();
              // ignore: avoid_bool_literals_in_conditional_expressions
              Navigator.of(context).pop(isDefault ? false : true);
            },
          ),
        ],
      ),
    );
  }
}
