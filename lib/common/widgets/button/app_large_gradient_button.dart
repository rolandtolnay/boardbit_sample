import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../../theme/color.dart';
import '../app_loading_indicator.dart';
import '../decorated_tappable.dart';

class AppLargeGradientButton extends StatelessWidget {
  const AppLargeGradientButton({
    super.key,
    required this.title,
    this.enabled = true,
    this.loading = false,
    this.icon,
    this.onPressed,
  });

  final String title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final loadingIndicator = Visibility(
      visible: loading,
      child: AppLoadingIndicator(color: context.colorScheme.onPrimary),
    );

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: icon != null,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: icon ?? const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: context.typography.buttonLarge,
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 152,
        minHeight: 54,
        maxHeight: 54,
      ),
      child: DecoratedTappable(
        onTap: enabled && !loading ? onPressed : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(2, 3),
              blurRadius: 24,
            ),
          ],
          gradient: enabled && !loading
              ? context.color.primaryGradient
              : context.color.primaryGradientDisabled,
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
        child: IntrinsicWidth(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(opacity: loading ? 0 : 1, child: content),
              loadingIndicator,
            ],
          ),
        ),
      ),
    );
  }
}
