import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../extensions/build_context_ext.dart';

class AppSkeletonizer extends StatelessWidget {
  const AppSkeletonizer({
    super.key,
    required this.child,
    this.loading = true,
    this.shimmerColor = const Color(0xFFE2E3E5),
  });

  final Widget child;
  final bool loading;
  final Color shimmerColor;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      containersColor: context.color.offWhite,
      effect: ShimmerEffect(baseColor: shimmerColor),
      child: child,
    );
  }
}
