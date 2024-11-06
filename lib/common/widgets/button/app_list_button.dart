import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../extensions/build_context_ext.dart';
import '../../theme/color.dart';
import '../decorated_tappable.dart';

class AppListButton extends StatelessWidget {
  const AppListButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.textColor,
    this.showAuxArrow = true,
  });

  final String title;

  /// Recommended size 18x18
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? textColor;
  final bool showAuxArrow;

  @override
  Widget build(BuildContext context) {
    return DecoratedTappable(
      onTap: onPressed,
      decoration: BoxDecoration(
        color: context.color.offWhite,
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 24,
            offset: Offset(2, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: icon,
            ),
          ),
          Text(
            title,
            style: context.typography.subtitleLarge.copyWith(
              color: textColor ?? const Color(0xff363636),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: showAuxArrow,
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              color: context.color.iconColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
