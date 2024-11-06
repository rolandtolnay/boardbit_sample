import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import 'button/app_floating_icon_button.dart';
import 'keyboard_focus_detector.dart';
import 'loading_scaffold.dart';

const _topMargin = 8.0;

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.trailing,
    this.leading,
    this.title,
    this.titleWidget,
    this.automaticallyImplyLeading = true,
    this.resizeToAvoidBottomInset = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.safeAreaValues = const SafeAreaValues(),
    this.onBackButtonPressed,
    this.overlayAppBar = false,
    this.navigateBackOnLeftSwipe = true,
    this.loadingOverlay = false,
    this.pageAction,
    this.alwaysPadTrailing = true,
  }) : assert(
          title == null || titleWidget == null,
          'title or titleWidget needs to be null',
        );

  final Widget body;
  final String? title;
  final Widget? titleWidget;

  final SafeAreaValues safeAreaValues;
  final Widget? trailing;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool resizeToAvoidBottomInset;
  final EdgeInsetsGeometry padding;

  /// Preferrably a `PageActionContainer` overlayed at the bottom
  final Widget? pageAction;

  /// Toggles swipe from left screen edge to navigate back
  final bool navigateBackOnLeftSwipe;

  /// If true, body will be rendered full screen and app bar on top
  final bool overlayAppBar;

  /// Override automatically implifed back button functionality.
  /// If provided, needs to manage popping stack as well.
  final VoidCallback? onBackButtonPressed;

  /// If true, a transparent overlay with loading indicator is shown on top of the body
  final bool loadingOverlay;

  /// If true, adds right padding to app bar even if no trailing widget is provided
  /// If false, right padding is only added if trailing widget is provided
  final bool alwaysPadTrailing;

  static const double appBarHeight = 58;

  @override
  Widget build(BuildContext context) {
    final appBar = ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: _topMargin, bottom: _topMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 64),
            Expanded(
              child: titleWidget ??
                  AutoSizeText(
                    title ?? '',
                    style: context.typography.headline,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
            ),
            Visibility(
              visible: trailing != null || alwaysPadTrailing,
              child: const SizedBox(width: 64),
            ),
          ],
        ),
      ),
    );

    return PopScope(
      canPop: navigateBackOnLeftSwipe ||
          !Navigator.of(context).userGestureInProgress,
      child: KeyboardFocusDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: SafeArea(
            left: safeAreaValues.left,
            top: safeAreaValues.top,
            right: safeAreaValues.right,
            bottom: pageAction == null && safeAreaValues.bottom,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: overlayAppBar ? 0 : 64,
                  bottom: 0,
                  child: Padding(
                    padding: padding,
                    child: body,
                  ),
                ),
                Visibility(
                  visible: title != null || titleWidget != null,
                  child: Positioned(
                    left: 16,
                    right: 16,
                    height: appBarHeight,
                    child: appBar,
                  ),
                ),
                Visibility(
                  visible: loadingOverlay,
                  child: Positioned.fill(
                    child: AbsorbPointer(
                      child: ColoredBox(
                        color: Colors.white.withOpacity(0.7),
                        child: const LoadingScaffoldBody(),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: automaticallyImplyLeading && context.canPop,
                  child: Positioned(
                    top: _topMargin,
                    left: 16,
                    child: FloatingBackButton(onPressed: onBackButtonPressed),
                  ),
                ),
                Visibility(
                  visible: leading != null,
                  child: Positioned(
                    top: _topMargin,
                    left: 16,
                    child: leading ?? const SizedBox.shrink(),
                  ),
                ),
                Visibility(
                  visible: trailing != null,
                  child: Positioned(
                    top: _topMargin,
                    right: 16,
                    child: trailing ?? const SizedBox.shrink(),
                  ),
                ),
                Visibility(
                  visible: pageAction != null,
                  child: Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: pageAction ?? const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// An immutable set of values, specifying whether to avoid system intrusions for specific sides
class SafeAreaValues {
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;

  const SafeAreaValues({
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
  });

  factory SafeAreaValues.none() => const SafeAreaValues(
        left: false,
        top: false,
        right: false,
        bottom: false,
      );
}
