import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import 'app_cached_network_image.dart';
import 'app_scaffold.dart';
import 'button/app_floating_icon_button.dart';

class FlexibleImageScaffold extends StatelessWidget {
  const FlexibleImageScaffold({
    super.key,
    required this.bodySliver,
    this.clipBackgroundColor,
    this.imageUrl,
    this.automaticallyImplyLeading = true,
    this.safeAreaValues = const SafeAreaValues(top: false),
    this.leading,
    this.trailing,
    this.flexibleWidget,
  });

  final Widget? flexibleWidget;
  final String? imageUrl;
  final Widget bodySliver;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget? trailing;
  final SafeAreaValues safeAreaValues;

  /// The color of the background behind the body sliver rounded border clip.
  /// This should match the color of the bottom part of the flexible image.
  final Color? clipBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final imageHeight = (imageUrl ?? '').isNotEmpty || flexibleWidget != null
        ? context.screenHeight * 0.33
        : 40.0;

    final flexibleImage = SliverAppBar(
      leading: const SizedBox.shrink(),
      expandedHeight: imageHeight,
      collapsedHeight: 0,
      toolbarHeight: 0,
      stretch: true,
      pinned: true,
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: flexibleWidget ??
            Visibility(
              visible: (imageUrl ?? '').isNotEmpty,
              child: AppCachedNetworkImage(
                imageUrl: imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
      ),
    );

    const borderRadius = 24.0;
    final clipBgColor = clipBackgroundColor ?? context.color.primaryDark;
    return Scaffold(
      body: SafeArea(
        left: safeAreaValues.left,
        top: safeAreaValues.top,
        right: safeAreaValues.right,
        bottom: safeAreaValues.bottom,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomScrollView(
              slivers: [
                flexibleImage,
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Container(
                        color: clipBgColor,
                        height: borderRadius,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(borderRadius),
                          topRight: Radius.circular(borderRadius),
                        ),
                        child: Container(
                          color: context.theme.scaffoldBackgroundColor,
                          height: borderRadius,
                        ),
                      ),
                    ],
                  ),
                ),
                bodySliver,
              ],
            ),
            Visibility(
              visible: automaticallyImplyLeading && context.canPop,
              child: Positioned(
                top: (safeAreaValues.top ? 0 : context.topSafeArea) + 8,
                left: 16,
                child: const FloatingBackButton(),
              ),
            ),
            Visibility(
              visible: leading != null,
              child: Positioned(
                top: (safeAreaValues.top ? 0 : context.topSafeArea) + 8,
                left: 16,
                child: leading ?? const SizedBox.shrink(),
              ),
            ),
            Visibility(
              visible: trailing != null,
              child: Positioned(
                top: (safeAreaValues.top ? 0 : context.topSafeArea) + 8,
                right: 16,
                child: trailing ?? const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
