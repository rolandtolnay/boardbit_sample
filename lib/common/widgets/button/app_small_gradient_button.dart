import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../../theme/color.dart';
import '../app_loading_indicator.dart';
import '../decorated_tappable.dart';

class AppSmallGradientButton extends StatelessWidget {
  const AppSmallGradientButton({
    super.key,
    this.title,
    this.enabled = true,
    this.loading = false,
    this.onPressed,
    this.icon,
    this.height = 44,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  }) : assert(title != null || icon != null, 'Title or icon must be provided');

  final String? title;
  final bool enabled;
  final bool loading;
  final VoidCallback? onPressed;

  final double height;

  final BorderRadius borderRadius;

  /// Recomended size 20x20, color white
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final loadingIndicator = Visibility(
      visible: loading,
      child: const AppLoadingIndicator(color: Colors.white),
    );

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: icon != null,
          replacement: const SizedBox(width: 8),
          child: Padding(
            padding: EdgeInsets.only(right: title != null ? 12 : 0),
            child: icon ?? const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: Text(
            title ?? '',
            style: context.typography.buttonSmall.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center,
          ),
        ),
        Visibility(visible: icon == null, child: const SizedBox(width: 8)),
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: height,
      ),
      child: DecoratedTappable(
        onTap: enabled && !loading ? onPressed : null,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
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
        padding: EdgeInsets.fromLTRB(
          12,
          12,
          (icon != null && title != null) ? 16 : 12,
          12,
        ),
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
