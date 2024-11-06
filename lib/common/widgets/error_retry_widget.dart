import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../translations/locale_keys.g.dart';
import 'page_image_cta.dart';

class ErrorRetryWidget extends StatelessWidget {
  const ErrorRetryWidget({
    super.key,
    this.onRetry,
    this.padding = const EdgeInsets.only(top: 64),
  });

  final VoidCallback? onRetry;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final title = tr(LocaleKeys.common_error_title);
    final subtitle = tr(LocaleKeys.common_error_subtitle);

    return PageImageCta(
      title: title,
      subtitle: subtitle,
      image: Assets.images.error.image(
        width: 208,
        height: 208,
        fit: BoxFit.cover,
      ),
      padding: padding,
      ctaTitle: tr(LocaleKeys.common_retry),
      onCtaPressed: onRetry,
    );
  }
}
