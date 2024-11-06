import 'package:flutter/cupertino.dart';

import '../extensions/build_context_ext.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.color,
    this.alignment = Alignment.center,
  });

  final Color? color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.color.primary;

    return Align(
      alignment: alignment,
      child: CupertinoActivityIndicator(color: color),
    );
  }
}
