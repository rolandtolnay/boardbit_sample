import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';

class AppUnderlineButton extends StatelessWidget {
  const AppUnderlineButton({
    super.key,
    required this.title,
    this.onPressed,
    this.enabled = true,
    this.color,
    this.textHeight = 28 / 13,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? color;
  final double textHeight;

  @override
  Widget build(BuildContext context) {
    final color = enabled
        ? this.color ?? context.color.primary
        : context.color.primaryDisabled;
    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          title,
          style: context.typography.buttonSmall.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
            decoration: TextDecoration.underline,
            decorationColor: color,
            height: textHeight,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
