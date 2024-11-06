import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import '../theme/color.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.color.primaryLight.withOpacity(0.2),
      height: height,
    );
  }
}

class AppDividerShadow extends StatelessWidget {
  const AppDividerShadow({
    super.key,
    this.height,
    this.shadowBottom = true,
  });

  final double? height;

  final bool shadowBottom;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, shadowBottom ? 2 : -2),
          ),
        ],
      ),
      child: Divider(
        color: context.color.primaryLight.withOpacity(0.2),
        height: height,
      ),
    );
  }
}
