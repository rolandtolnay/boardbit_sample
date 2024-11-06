import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import '../extensions/build_context_ext.dart';
import 'rounded_box.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.iconData,
    required this.label,
    this.backgroundColor,
    this.labelColor,
    this.iconColor,
  });

  final IconData iconData;
  final String label;

  final Color? backgroundColor;
  final Color? labelColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      color: backgroundColor ?? context.color.neutral200,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          HugeIcon(
            icon: iconData,
            color: iconColor ?? context.color.neutral600,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: context.typography.labelSmall.copyWith(
              color: labelColor ?? context.color.neutral700,
              fontFeatures: [const FontFeature.tabularFigures()],
              height: 18 / 12,
            ),
          ),
        ],
      ),
    );
  }
}
