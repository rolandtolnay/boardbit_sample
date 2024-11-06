import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth/user_provider.dart';
import '../common/extensions/build_context_ext.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/app_text_field.dart';
import '../common/widgets/button/app_large_gradient_button.dart';
import '../translations/locale_keys.g.dart';

class OnboardingNameInputPage extends HookConsumerWidget {
  const OnboardingNameInputPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const OnboardingNameInputPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = useTextEditingController();
    useListenable(inputController);

    final nameInput = inputController.text.trim();
    return AppScaffold(
      automaticallyImplyLeading: false,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Text(
            tr(LocaleKeys.onboarding_headline),
            style: context.typography.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          AppTextField(
            controller: inputController,
            textCapitalization: TextCapitalization.words,
          ),
          const Spacer(flex: 2),
          Align(
            child: AppLargeGradientButton(
              title: tr(LocaleKeys.onboarding_cta_title),
              enabled: nameInput.isNotEmpty,
              onPressed: () {
                ref.read(userProvider.notifier).updateDisplayName(nameInput);
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
