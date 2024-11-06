import 'dart:math';

import 'package:flutter/material.dart';

import '../../common/extensions/build_context_ext.dart';

class HexagonContainer extends StatelessWidget {
  const HexagonContainer({
    super.key,
    required this.fillColor,
    required this.label,
    this.labelStyle,
    this.padding = const EdgeInsets.all(10),
  });

  final Color fillColor;
  final String label;

  final TextStyle? labelStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HexagonPainter(fillColor: fillColor),
      child: Center(
        child: Padding(
          padding: padding,
          child: Text(
            label,
            style: labelStyle ??
                context.typography.label.copyWith(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color fillColor;

  HexagonPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path();
    const angle = (2 * pi) / 6;
    const rotationAngle = pi / 6;

    for (var i = 0; i < 6; i++) {
      final x =
          size.width / 2 + size.width / 2 * cos(angle * i + rotationAngle);
      final y =
          size.height / 2 + size.height / 2 * sin(angle * i + rotationAngle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
