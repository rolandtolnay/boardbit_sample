import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import 'app_cached_network_image.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageUrl,
    this.imageFit = BoxFit.cover,
    this.description,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.descriptionPadding =
        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    this.imagePadding = EdgeInsets.zero,
    this.descriptionMaxLines = 3,
    this.descriptionTextStyle,
    this.backgroundGradient,
    this.alignment = Alignment.center,
  });

  final String imageUrl;
  final BoxFit imageFit;
  final String? description;

  final BorderRadiusGeometry borderRadius;
  final EdgeInsets imagePadding;
  final EdgeInsets descriptionPadding;
  final int descriptionMaxLines;
  final TextStyle? descriptionTextStyle;

  /// Color to display underneath the image. Useful if image has transparent components
  final Gradient? backgroundGradient;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Visibility(
            visible: backgroundGradient != null,
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: backgroundGradient),
            ),
          ),
          Visibility(
            visible: imageUrl.isNotEmpty,
            replacement: Container(
              decoration: BoxDecoration(
                gradient: context.color.primaryGradientDisabled,
              ),
            ),
            child: Padding(
              padding: imagePadding,
              child: AppCachedNetworkImage(
                imageUrl: imageUrl,
                fit: imageFit,
                alignment: alignment,
                errorWidget: (_, __, ___) => Container(
                  decoration: BoxDecoration(
                    gradient: context.color.primaryGradientDisabled,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: description != null && imageUrl.isNotEmpty,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),
          Visibility(
            visible: description != null,
            child: Positioned(
              bottom: descriptionPadding.bottom,
              left: descriptionPadding.left,
              right: descriptionPadding.right,
              child: AutoSizeText(
                description ?? '',
                style: descriptionTextStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      height: 1.5,
                      color: Colors.white,
                    ),
                maxLines: descriptionMaxLines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
