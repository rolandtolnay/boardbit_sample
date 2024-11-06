import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/extensions/build_context_ext.dart';
import '../common/widgets/app_list_view.dart';
import '../common/widgets/app_skeletonizer.dart';
import '../common/widgets/error_retry_widget.dart';
import '../common/widgets/page_section_title.dart';
import '../profile/settings_page.dart';
import '../root/widgets/app_bottom_navigation_bar.dart';
import '../root/widgets/tab_scrollable_page.dart';
import '../translations/locale_keys.g.dart';
import 'domain/game_detail_entity.dart';
import 'provider/hot_game_provider.dart';
import 'widgets/game_list_tile.dart';
import 'widgets/game_page_item.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(hotGameProvider);

    final gameList = gameState.valueOrNull ?? [];
    final items = useMemoized(() => makeItems(gameList), [gameList]);

    return TabScrollablePage(
      child: gameState.when(
        skipLoadingOnRefresh: false,
        data: (_) => _buildListView(ref, items),
        loading: () => AppSkeletonizer(
          child: _buildListView(
            ref,
            makeItems(List.generate(5, (_) => GameDetailEntity.stub())),
          ),
        ),
        error: (e, _) => Center(
          child: ErrorRetryWidget(
            onRetry: () => ref.invalidate(hotGameProvider),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  AppListView<GamePageItem> _buildListView(
    WidgetRef ref,
    List<GamePageItem> items,
  ) {
    return AppListView(
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(
        bottom: ref.context.bottomSafeArea + kAppBottomNavigationBarHeight,
        left: 16,
        right: 16,
      ),
      items: items,
      itemBuilder: (c, item, index) => switch (item) {
        GamePageTitleItem() => Padding(
            padding: const EdgeInsets.only(left: 16),
            child: PageSectionTitle(
              title: item.title,
              trailing: item.trailingWidget?.call(c),
            ),
          ),
        GamePageGameItem() => GameListTile(game: item.game)
      },
    );
  }

  List<GamePageItem> makeItems(Iterable<GameDetailEntity> games) {
    final items = <GamePageItem>[];
    items.add(
      GamePageTitleItem(
        tr(LocaleKeys.games_hot_games),
        trailingWidget: (_) => const AppSimpleSettingsButton(),
      ),
    );
    for (final game in games) {
      items.add(GamePageGameItem(game));
    }
    return items;
  }
}
