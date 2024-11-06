import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import '../theme/color.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    super.key,
    this.onTap,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.color,
    this.borderColor,
    this.gradient,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final Gradient? gradient;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? context.color.offWhite,
          gradient: gradient,
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(2, 3),
              blurRadius: 24,
            ),
          ],
          borderRadius: BorderRadius.circular(14),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
