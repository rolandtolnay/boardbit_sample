import 'package:flutter/widgets.dart';

import '../extensions/build_context_ext.dart';

class TextChip extends StatelessWidget {
  const TextChip({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.color.primaryLight,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Text(
        text,
        style: context.typography.labelSmall.copyWith(
          fontSize: 11,
          color: textColor ?? const Color(0xFFF8F8F8),
          fontWeight: FontWeight.w800,
          height: 16 / 11,
          fontFeatures: [const FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}
