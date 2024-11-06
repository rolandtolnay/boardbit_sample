import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';

class PageSectionTitle extends StatelessWidget {
  const PageSectionTitle({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        children: [
          Expanded(
            child: AutoSizeText(
              title,
              style: context.typography.headline.copyWith(height: 24 / 24),
              maxLines: 1,
            ),
          ),
          if (trailing != null)
            Align(
              alignment: const Alignment(1, 0.4),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: trailing,
              ),
            ),
        ],
      ),
    );
  }
}
