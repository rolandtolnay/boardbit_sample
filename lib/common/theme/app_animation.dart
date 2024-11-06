import 'package:flutter/material.dart';

class AppAnimation {
  /// Used when elements move from one place to the other, or disappear only temporariliy
  static const curveStandard = Curves.easeInOutCubic;

  /// Used when elements appear on the screen
  static const curveAppear = Curves.easeOutCubic;

  /// Used when elements disappear from the screen
  static const curveDisappear = Curves.easeInCubic;

  /// Used when we want to speed up the animation start.
  ///
  /// Recommended duration normal.
  static const curveSnappy = Curves.fastOutSlowIn;

  /// Used on small buttons
  static const durationFast = Duration(milliseconds: 200);

  /// Used on most interface elements, and travel distances
  static const durationNormal = Duration(milliseconds: 300);

  /// Used on bigger interface elements, or longer distances
  static const durationSlow = Duration(milliseconds: 500);
}
