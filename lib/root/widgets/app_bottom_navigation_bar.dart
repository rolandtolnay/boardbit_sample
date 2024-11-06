import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/extensions/build_context_ext.dart';
import '../app_tab_enum.dart';

const kAppBottomNavigationBarHeight = kBottomNavigationBarHeight + 4;

class AppBottomNavigationBar extends HookConsumerWidget {
  const AppBottomNavigationBar({super.key, this.hideAnimationController});

  final AnimationController? hideAnimationController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBottomNavigationBar.builder(
      leftCornerRadius: 30,
      rightCornerRadius: 30,
      height: kAppBottomNavigationBarHeight,
      itemCount: AppTab.values.length,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      splashSpeedInMilliseconds: 0,
      hideAnimationController: hideAnimationController,
      hideAnimationCurve: Curves.easeInOutCubic,
      shadow: const BoxShadow(
        color: Color.fromRGBO(122, 111, 85, 0.3),
        offset: Offset(2, -3),
        blurRadius: 30,
      ),
      tabBuilder: (index, isActive) {
        final tab = AppTab.values[index];
        final iconColor =
            isActive ? context.color.primary : const Color(0xff7F8F8E);
        final textColor =
            isActive ? context.color.primary : const Color(0xff717C7C);

        // Fixes temporary renderflex issue when keyboard is open
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 8),
              tab.buildIcon(color: iconColor),
              const SizedBox(height: 2),
              Text(
                tab.text,
                style: context.typography.labelSmall.copyWith(
                  color: textColor,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
      activeIndex: ref.watch(appTabProvider).index,
      onTap: (index) => _onTabSelected(context, ref, index),
    );
  }

  void _onTabSelected(BuildContext context, WidgetRef ref, int index) {
    final isFirst = ModalRoute.of(context)?.isFirst ?? true;
    if (!isFirst) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
    final tab = AppTab.values[index];
    ref.read(appTabProvider.notifier).state = tab;
  }
}
