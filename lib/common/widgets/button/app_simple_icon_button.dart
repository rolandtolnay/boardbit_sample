import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../decorated_tappable.dart';

class AppSimpleIconButton extends StatelessWidget {
  const AppSimpleIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.enabled = true,
  });

  /// Recommended size is 24x24
  final Widget icon;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const padding = 10.0;

    return DecoratedTappable(
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        color: color ?? context.color.primaryLight.withOpacity(0.1),
      ),
      onTap: enabled ? onPressed : null,
      child: icon,
    );
  }
}
