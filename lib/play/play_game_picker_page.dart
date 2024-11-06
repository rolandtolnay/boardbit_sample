import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/extensions/build_context_ext.dart';
import '../common/haptic_provider.dart';
import '../common/widgets/app_list_view.dart';
import '../common/widgets/app_loading_indicator.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/app_search_input.dart';
import '../common/widgets/button/app_floating_icon_button.dart';
import '../common/widgets/error_retry_widget.dart';
import '../common/widgets/rounded_box.dart';
import '../translations/locale_keys.g.dart';
import 'play_date_picker_page.dart';
import 'provider/play_builder_provider.dart';
import 'provider/search_game_provider.dart';
import 'provider/user_player_provider.dart';

class PlayGamePickerPage extends HookConsumerWidget {
  const PlayGamePickerPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => const PlayGamePickerPage(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userPlayerProvider);
    ref.watch(playBuilderProvider);

    _listenOnUserPlayerFetched(ref);

    final inputController = useTextEditingController();

    final query = ref.watch(searchGameQueryProvider);
    final gameListState = ref.watch(searchGameProvider(query));

    final resultList = gameListState.when(
      skipLoadingOnRefresh: false,
      data: (gameList) => AppListView(
        items: gameList,
        itemBuilder: (c, item, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: RoundedBox(
            onTap: () {
              FocusScope.of(context).unfocus();

              ref.read(playBuilderProvider.notifier).setGame(item);
              Navigator.of(context).push(PlayDatePickerPage.route());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  style: context.typography.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  item.yearPublished ?? '',
                  style: context.typography.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        emptyBuilder: (_) => Visibility(
          visible: query.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Text(
              tr(LocaleKeys.common_no_items),
              style: context.typography.labelSmall,
            ),
          ),
        ),
      ),
      loading: () => const Padding(
        padding: EdgeInsets.only(top: 64),
        child: AppLoadingIndicator(
          alignment: Alignment.topCenter,
        ),
      ),
      error: (e, _) => ErrorRetryWidget(
        onRetry: () => ref.invalidate(searchGameProvider(query)),
      ),
    );

    return AppScaffold(
      automaticallyImplyLeading: false,
      safeAreaValues: const SafeAreaValues(bottom: false),
      trailing: FloatingCloseButton(
        onPressed: () {
          ref.feedbackLight();
          Navigator.of(context).popUntil((r) => r.isFirst);
        },
      ),
      body: Column(
        children: [
          Text(
            tr(LocaleKeys.plays_game_picker_headline),
            style: context.typography.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          AppSearchInput(
            controller: inputController,
            onChanged: ref.read(searchGameQueryProvider.notifier).update,
          ),
          const SizedBox(height: 16),
          Expanded(child: resultList),
        ],
      ),
    );
  }

  void _listenOnUserPlayerFetched(WidgetRef ref) {
    ref.listen(userPlayerProvider, (_, next) {
      next.whenData((player) {
        if (player == null) {
          ref.read(userPlayerProvider.notifier).createUserPlayer();
        }
      });
    });
  }
}
