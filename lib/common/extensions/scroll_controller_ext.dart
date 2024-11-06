import 'package:flutter/material.dart';

import '../theme/app_animation.dart';

extension ScrollToTop on ScrollController {
  void scrollToStart() {
    if (!hasClients) return;
    animateTo(0, duration: AppAnimation.durationNormal, curve: Curves.easeOut);
  }

  void scrollToEnd() {
    if (!hasClients) return;
    animateTo(
      position.maxScrollExtent,
      duration: AppAnimation.durationNormal,
      curve: Curves.easeOut,
    );
  }
}
