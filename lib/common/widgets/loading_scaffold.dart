import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_loading_indicator.dart';
import 'app_scaffold.dart';

class LoadingScaffold extends HookConsumerWidget {
  const LoadingScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppScaffold(body: LoadingScaffoldBody());
  }
}

class LoadingScaffoldBody extends StatelessWidget {
  const LoadingScaffoldBody({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Align(
          child: SizedBox(width: 64, child: AppLoadingIndicator(color: color)),
        ),
        const SizedBox(height: 64),
        const Spacer(),
      ],
    );
  }
}
