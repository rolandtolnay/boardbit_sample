import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../translations/locale_keys.g.dart';
import '../extensions/build_context_ext.dart';
import 'app_text_field.dart';

class AppSearchInput extends HookConsumerWidget {
  const AppSearchInput({
    super.key,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.focusNode,
    this.hasPrefixIcon = true,
    this.autofocus = true,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.maxLength,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  final FocusNode? focusNode;

  final String? hintText;
  final bool hasPrefixIcon;
  final bool autofocus;

  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useListenable(controller);

    final focusNode = this.focusNode ?? useFocusNode();

    return AppTextField(
      controller: controller,
      autofocus: autofocus,
      focusNode: focusNode,
      hintText: hintText ?? tr(LocaleKeys.common_search),
      onChanged: (input) => onChanged?.call(input),
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      maxLength: maxLength,
      prefixIcon: hasPrefixIcon
          ? SizedBox.square(
              dimension: 20,
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: context.color.lightGrey,
                  size: 20,
                ),
              ),
            )
          : null,
      suffixIcon: controller.text.isNotEmpty
          ? InkWell(
              onTap: () {
                controller.clear();
                onChanged?.call('');
                focusNode.requestFocus();
              },
              child: SizedBox.square(
                dimension: 20,
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedCancelCircle,
                    color: context.color.lightGrey,
                    size: 20,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
