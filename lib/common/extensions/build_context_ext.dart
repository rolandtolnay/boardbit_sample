import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../theme/typography.dart';

extension BuildContextTheme on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  double get topSafeArea => MediaQuery.of(this).padding.top;

  double get bottomSafeArea => MediaQuery.of(this).padding.bottom;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get disabledColor => Theme.of(this).disabledColor;

  ColorLight get color => const ColorLight();

  TypographyLight get typography => const TypographyLight();
}

extension BuildContextNavigatorConvenience on BuildContext {
  bool get isTopMostRoute => ModalRoute.of(this)?.isCurrent ?? false;

  bool get canPop => ModalRoute.of(this)?.canPop ?? false;
}

extension ColorFilerConvenience on Color {
  ColorFilter get filter => ColorFilter.mode(this, BlendMode.srcIn);
}
