import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import 'button/app_large_gradient_button.dart';

class PageImageCta extends StatelessWidget {
  const PageImageCta({
    super.key,
    required this.title,
    required this.image,
    this.subtitle,
    this.padding = const EdgeInsets.only(top: 64),
    this.ctaTitle,
    this.onCtaPressed,
  });

  final String title;
  final String? subtitle;

  /// Recommended size 208x208
  final Widget image;

  final EdgeInsetsGeometry padding;
  final String? ctaTitle;
  final VoidCallback? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: image,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: context.typography.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle ?? '',
            style: context.typography.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          if (ctaTitle != null)
            Align(
              child: AppLargeGradientButton(
                title: ctaTitle ?? '',
                onPressed: onCtaPressed,
              ),
            ),
        ],
      ),
    );
  }
}
