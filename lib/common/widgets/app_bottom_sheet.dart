import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../translations/locale_keys.g.dart';
import '../extensions/build_context_ext.dart';
import '../haptic_provider.dart';
import 'button/app_large_gradient_button.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.actions,
    this.description,
    this.title,
    this.titleIcon,
    this.textAlign = TextAlign.center,
  });

  static Future<void> show(
    BuildContext context, {
    required Widget actions,
    String? description,
    String? title,
    Widget? titleIcon,
    TextAlign textAlign = TextAlign.center,
  }) {
    return showAppModalBottomSheet(
      context: context,
      builder: (_) => AppBottomSheet(
        actions: actions,
        description: description,
        title: title,
        titleIcon: titleIcon,
        textAlign: textAlign,
      ),
    );
  }

  static Future<void> showDescription(
    BuildContext context, {
    required String description,
    TextAlign textAlign = TextAlign.start,
  }) {
    return showAppModalBottomSheet(
      context: context,
      builder: (_) => AppBottomSheet(
        actions: Consumer(
          builder: (__, ref, _) => AppLargeGradientButton(
            title: tr(LocaleKeys.common_dismiss),
            onPressed: () {
              ref.feedbackSelection();
              Navigator.of(ref.context).pop();
            },
          ),
        ),
        description: description,
        textAlign: textAlign,
      ),
    );
  }

  final String? title;

  /// Suggested size 24 x 24
  final Widget? titleIcon;
  final String? description;

  final Widget actions;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.screenHeight * 0.8),
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: title != null,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: textAlign.toMainAxisAlignment,
                      children: [
                        Visibility(
                          visible: titleIcon != null,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: titleIcon,
                          ),
                        ),
                        Text(
                          title ?? '',
                          style: context.typography.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: description != null,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 32),
                    child: Text(
                      description ?? '',
                      style: context.typography.bodyMedium
                          .copyWith(height: 24 / 14),
                      textAlign: textAlign,
                    ),
                  ),
                ),
                Align(child: actions),
                SizedBox(height: context.bottomSafeArea > 0 ? 16 : 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on TextAlign {
  MainAxisAlignment get toMainAxisAlignment {
    switch (this) {
      case TextAlign.center:
        return MainAxisAlignment.center;
      case TextAlign.right:
      case TextAlign.end:
        return MainAxisAlignment.end;
      case TextAlign.justify:
        return MainAxisAlignment.spaceBetween;
      case TextAlign.left:
      case TextAlign.start:
        return MainAxisAlignment.start;
    }
  }
}

Future<T?> showAppModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isDismissible = true,
  bool? showDragHandle,
}) {
  FocusScope.of(context).requestFocus(FocusNode());
  return showModalBottomSheet<T>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    showDragHandle: showDragHandle,
    builder: builder,
  );
}
