import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/widgets/loading_scaffold.dart';
import '../root/root_page.dart';
import 'auth_state_provider.dart';
import 'domain/auth_repository.dart';
import 'user_provider.dart';

class AuthWidget extends HookConsumerWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = ref.watch(userProvider);

    switch (authState) {
      case AuthState.loading:
      case AuthState.signedOut:
        return const LoadingScaffold();
      case AuthState.authenticated:
      case AuthState.anonymous:
        if (user == null) return const LoadingScaffold();
        return const RootPage();
    }
  }
}
