import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../common/extensions/build_context_ext.dart';
import '../gen/fonts.gen.dart';

extension BuildContextAppTheme on BuildContext {
  ThemeData get appTheme => FlexThemeData.light(
        colors: FlexSchemeColor(
          primary: color.primary,
          primaryContainer: const Color(0xffd0e4ff),
          secondary: color.accent,
          secondaryContainer: const Color(0xffffdbcf),
          tertiary: const Color(0xff708090),
          tertiaryContainer: const Color(0xff95f0ff),
          appBarColor: const Color(0xffffdbcf),
          error: const Color(0xffb00020),
        ),
        onPrimary: Colors.white,
        scaffoldBackground: color.backgroundScaffold,
        usedColors: 2,
        subThemesData: const FlexSubThemesData(
          useM2StyleDividerInM3: true,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          keepPrimary: true,
          keepSecondary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: FontFamily.nunito,
      );
}
