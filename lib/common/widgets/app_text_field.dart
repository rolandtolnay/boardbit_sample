import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import '../theme/color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 16,
    ),
    this.onSubmitted,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.autofocus = true,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
    this.focusNode,
    this.label,
    this.style,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.showCounterText = false,
  });

  final String? label;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int maxLines;
  final int minLines;
  final bool autofocus;
  final EdgeInsetsGeometry padding;

  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool showCounterText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label ?? '',
              style: context.typography.subtitleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xff363636),
              ),
            ),
          ),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                spreadRadius: 2,
                blurRadius: 24,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            autofocus: autofocus,
            focusNode: focusNode,
            autofillHints: autofillHints,
            decoration: InputDecoration(
              contentPadding: padding,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: context.color.backgroundScaffold),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: context.color.primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: context.color.backgroundScaffold),
              ),
              hoverColor: context.color.backgroundScaffold.withOpacity(0.4),
              fillColor: context.color.offWhite,
              filled: true,
              counter: showCounterText ? null : const SizedBox.shrink(),
              counterStyle: context.typography.labelSmallest,
              hintText: hintText,
              hintStyle: style?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff838383),
                  ) ??
                  context.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff838383),
                  ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
            style: style ??
                context.typography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff454545),
                ),
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            onTap: onTap,
            onTapOutside: onTapOutside,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            textCapitalization: textCapitalization,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
          ),
        ),
      ],
    );
  }
}
