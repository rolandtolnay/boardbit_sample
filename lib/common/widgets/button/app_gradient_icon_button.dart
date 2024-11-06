import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../app_loading_indicator.dart';
import '../decorated_tappable.dart';

class AppGradientIconButton extends StatelessWidget {
  const AppGradientIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 54,
    this.enabled = true,
    this.elevation = 4,
    this.gradient,
    this.loading = false,
  });

  /// Recommended size 20x20
  final Widget icon;
  final double size;
  final VoidCallback? onPressed;
  final bool enabled;
  final double elevation;
  final Gradient? gradient;

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return DecoratedTappable(
      onTap: enabled && !loading ? onPressed : null,
      width: size,
      height: size,
      elevation: elevation,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: enabled
            ? gradient ?? context.color.primaryGradient
            : context.color.primaryGradientDisabled,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(122, 111, 85, enabled ? 0.34 : 0.1),
            spreadRadius: 2,
            blurRadius: 26,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: loading
          ? AppLoadingIndicator(color: context.colorScheme.onPrimary)
          : Center(child: icon),
    );
  }
}
