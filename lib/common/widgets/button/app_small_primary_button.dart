import 'package:flutter/widgets.dart';

import '../../extensions/build_context_ext.dart';
import '../decorated_tappable.dart';

class AppSmallPrimaryButton extends StatelessWidget {
  const AppSmallPrimaryButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.color,
  });

  /// Recommended size 20x20
  final Widget icon;
  final String title;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 40, minHeight: 40),
      child: DecoratedTappable(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: color ?? context.color.primaryLight.withOpacity(0.1),
        ),
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            if (title.isNotEmpty) const SizedBox(width: 12),
            Text(
              title,
              style: context.typography.buttonSmall
                  .copyWith(color: context.color.primary),
              maxLines: 1,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
