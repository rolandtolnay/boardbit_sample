import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fit,
    this.errorWidget,
    this.alignment = Alignment.center,
  });

  final String imageUrl;
  final BoxFit? fit;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: context.color.primaryGradientDisabled,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      alignment: alignment,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      errorWidget: errorWidget,
    );
  }
}
