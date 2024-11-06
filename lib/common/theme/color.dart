import 'package:flutter/material.dart';

const Color kShadowColor = Color(0x4DB0C4DE);

class ColorLight {
  const ColorLight();

  Color get neutral100 => const Color(0xFFF4F4F5);
  Color get neutral200 => const Color(0xFFE9E9E9);
  Color get neutral400 => const Color(0xFFDDDDDD);
  Color get neutral500 => const Color(0xFFB9B9BB);
  Color get neutral600 => const Color(0xFF7A7A82);
  Color get neutral700 => const Color(0xFF41414D);
  Color get neutral800 => const Color(0xFF25252E);
  Color get neutral900 => const Color(0xFF060610);

  /// Used for backgrounds and large surface areas
  Color get offWhite => const Color(0xFFF8F8F8);

  /// Highlights, progress bars, and interactive elements
  Color get primary => const Color(0xff0f52ba);

  /// Text and secondary elements to maintain readability
  Color get primaryLight => const Color(0xff4a78e3);

  /// Used for backgrounds and large surface areas
  Color get primaryDark => const Color(0xff0c3d8a);

  /// Accents, icons, and buttons
  Color get accent => const Color(0xffff7f50);

  Color get alert => const Color(0xffFFC107);
  Color get success => const Color(0xff4CAF50);

  Color get backgroundScaffold => const Color(0xFFE6EEF8);
  Color get backgroundOverlay => const Color.fromRGBO(41, 45, 50, 0.6);

  Color get borderColor => const Color(0xFFB0BEC5);

  Color get primaryDisabled => const Color(0xffa8b9e1);

  Color get iconColor => const Color(0xff292D32);
  Color get lightGrey => const Color(0xff707070);

  Gradient get primaryGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff028CF3),
          Color(0xff0f52ba),
        ],
      );

  Gradient get primaryGradientDark => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff3567B2),
          Color(0xff0c3d8a),
        ],
      );

  Gradient get redGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffE57373),
          Color(0xffD32F2F),
        ],
      );

  Gradient get primaryGradientDisabled => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffb2d0f7),
          Color(0xffa8b9e1),
        ],
      );
}
