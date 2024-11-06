import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../extensions/build_context_ext.dart';
import '../../haptic_provider.dart';
import '../../theme/color.dart';

class AppFloatingIconButton extends StatelessWidget {
  const AppFloatingIconButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.onPressed,
    this.size = 44,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.borderSide,
    this.loading = false,
    this.elevation = 0,
  });

  /// Recommended size 20x20
  final Widget icon;

  final double size;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;
  final bool loading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    const loadingIndicator = SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator(),
    );
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(2, 3),
            blurRadius: 24,
          ),
        ],
      ),
      child: Material(
        color: backgroundColor ?? context.color.offWhite,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide ?? const BorderSide(color: Color(0xFFE3ECEB)),
        ),
        child: InkWell(
          onTap: loading ? null : onPressed,
          borderRadius: borderRadius,
          child: Center(child: loading ? loadingIndicator : icon),
        ),
      ),
    );
  }
}

class FloatingBackButton extends ConsumerWidget {
  const FloatingBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppFloatingIconButton(
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedArrowLeft01,
        color: context.color.iconColor,
        size: 20,
      ),
      borderSide: BorderSide.none,
      onPressed: onPressed ??
          () {
            ref.feedbackLight();
            Navigator.of(context).pop();
          },
    );
  }
}

class FloatingCloseButton extends ConsumerWidget {
  const FloatingCloseButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppFloatingIconButton(
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedCancel01,
        color: context.color.iconColor,
        size: 20,
      ),
      borderSide: BorderSide.none,
      onPressed: onPressed ??
          () {
            ref.feedbackLight();
            Navigator.of(context).pop();
          },
    );
  }
}
