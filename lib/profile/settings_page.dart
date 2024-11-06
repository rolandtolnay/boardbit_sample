import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../auth/user_provider.dart';
import '../common/extensions/build_context_ext.dart';
import '../common/haptic_provider.dart';
import '../common/use_init_hook.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/app_snack_bar.dart';
import '../common/widgets/app_text_field.dart';
import '../common/widgets/button/app_gradient_icon_button.dart';
import '../common/widgets/button/app_simple_icon_button.dart';
import '../translations/locale_keys.g.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    final inputController = useTextEditingController(
      text: user?.displayName ?? '',
    );
    useListenable(inputController);

    useAsyncEffect(
      () => inputController.text = user?.displayName ?? '',
      [user],
    );
    final submitLoading = useValueNotifier(false);

    final nameInput = inputController.text.trim();
    final submitNameButton = ValueListenableBuilder(
      valueListenable: submitLoading,
      builder: (_, loading, __) => AppGradientIconButton(
        loading: submitLoading.value,
        enabled: nameInput.isNotEmpty,
        icon: HugeIcon(
          icon: HugeIcons.strokeRoundedSent,
          color: context.color.offWhite,
          size: 20,
        ),
        onPressed: () async {
          submitLoading.value = true;
          await ref.read(userProvider.notifier).updateDisplayName(nameInput);
          submitLoading.value = false;

          if (!context.mounted) return;
          final title = tr(LocaleKeys.settings_name_updated);
          AppSnackBar.show(context, title: title);
        },
      ),
    );

    return AppScaffold(
      title: tr(LocaleKeys.settings_title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: inputController,
                      textCapitalization: TextCapitalization.words,
                      label: tr(LocaleKeys.settings_your_name),
                      autofocus: false,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: submitNameButton,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppSimpleSettingsButton extends ConsumerWidget {
  const AppSimpleSettingsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppSimpleIconButton(
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedSettings02,
        color: context.color.primary,
      ),
      onPressed: () {
        ref.feedbackLight();
        Navigator.of(context).push(SettingsPage.route());
      },
    );
  }
}
