import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';

class TypographyLight {
  const TypographyLight();

  /// At the top of pages
  TextStyle get headline => const TextStyle(
        fontSize: 24,
        height: 1.5,
        color: Color(0xff1f1f1f),
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w700,
      );

  /// Detail view under image
  TextStyle get titleLarge => const TextStyle(
        fontSize: 22,
        height: 1.5,
        color: Color(0xff1f1f1f),
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w600,
      );

  /// Section title
  TextStyle get titleSmall => const TextStyle(
        fontSize: 18,
        height: 1.5,
        color: Color(0xff1f1f1f),
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w500,
      );

  TextStyle get buttonLarge => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17,
        height: 1.5,
        color: Colors.white,
      );

  /// Used for address beneath title
  TextStyle get subtitleLarge => const TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Color(0xff707070),
      );

  /// Used for short text like phone number
  TextStyle get subtitleSmall => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.5,
        color: Color(0xff363636),
      );

  /// Used for long text like activity description
  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        height: 1.5,
        color: Color(0xff5f5f5f),
      );

  TextStyle get buttonSmall => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        height: 1.5,
        color: Color(0xff454545),
      );

  /// Used for short title text phone section title
  TextStyle get label => const TextStyle(
        fontSize: 13,
        height: 1.5,
        color: Color(0xff5f5f5f),
      );

  /// Used for short subtitles like review time ago
  TextStyle get labelSmall => const TextStyle(
        fontSize: 12,
        height: 1.5,
        color: Color(0xff545454),
      );

  TextStyle get labelSmallest => const TextStyle(
        color: Color(0xff707070),
        height: 16 / 11,
        fontSize: 11,
      );
}
