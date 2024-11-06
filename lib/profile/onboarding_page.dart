import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../common/extensions/build_context_ext.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/button/app_large_gradient_button.dart';
import '../gen/assets.gen.dart';
import '../translations/locale_keys.g.dart';
import 'onboarding_name_input_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => const OnboardingPage(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      automaticallyImplyLeading: false,
      resizeToAvoidBottomInset: false,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Text(
            tr(LocaleKeys.onboarding_welcome),
            style: context.typography.headline,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.hardEdge,
              child: Assets.images.onboarding.image(fit: BoxFit.cover),
            ),
          ),
          const Spacer(flex: 2),
          Align(
            child: AppLargeGradientButton(
              title: tr(LocaleKeys.common_continue),
              onPressed: () => Navigator.of(context).pushReplacement(
                OnboardingNameInputPage.route(),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
