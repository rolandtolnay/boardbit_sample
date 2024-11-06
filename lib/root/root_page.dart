import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth/user_provider.dart';
import '../common/use_init_hook.dart';
import '../profile/onboarding_page.dart';
import 'app_tab_enum.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import 'widgets/tab_add_play_button.dart';

class RootPage extends HookConsumerWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const RootPage());
  }

  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    useAsyncEffect(
      () {
        if (user == null) return;
        if ((user.displayName ?? '').isNotEmpty) return;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(OnboardingPage.route());
        });
      },
      [user],
    );

    return Scaffold(
      floatingActionButton: const TabAddPlayButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: SafeArea(
        child: ref.watch(appTabProvider).buildWidget(),
      ),
    );
  }
}
