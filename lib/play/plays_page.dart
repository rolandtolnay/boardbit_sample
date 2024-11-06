import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/extensions/build_context_ext.dart';
import '../common/haptic_provider.dart';
import '../common/widgets/app_list_view.dart';
import '../common/widgets/app_skeletonizer.dart';
import '../common/widgets/button/app_underline_button.dart';
import '../common/widgets/error_retry_widget.dart';
import '../common/widgets/page_image_cta.dart';
import '../common/widgets/page_section_title.dart';
import '../gen/assets.gen.dart';
import '../root/widgets/app_bottom_navigation_bar.dart';
import '../root/widgets/tab_scrollable_page.dart';
import '../translations/locale_keys.g.dart';
import 'domain/play_entity.dart';
import 'play_detail_page.dart';
import 'play_game_picker_page.dart';
import 'provider/play_provider.dart';
import 'widgets/play_list_tile.dart';
import 'widgets/play_page_item.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playListState = ref.watch(playProvider);

    final playList = playListState.valueOrNull ?? [];
    final items = useMemoized(() => makeItems(playList), [playList]);

    return TabScrollablePage(
      child: playListState.when(
        skipLoadingOnRefresh: false,
        data: (_) => _buildListView(ref, items),
        loading: () => AppSkeletonizer(
          child: _buildListView(
            ref,
            makeItems(List.generate(5, (_) => PlayEntity.stub())),
          ),
        ),
        error: (e, _) => Center(
          child: ErrorRetryWidget(
            onRetry: () => ref.invalidate(playProvider),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildListView(WidgetRef ref, List<PlayPageItem> items) {
    return AppListView(
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(
        bottom: ref.context.bottomSafeArea + kAppBottomNavigationBarHeight,
        left: 16,
        right: 16,
      ),
      items: items,
      itemBuilder: (c, item, index) => switch (item) {
        PlayPageTitleItem() => Padding(
            padding: const EdgeInsets.only(left: 16),
            child: PageSectionTitle(
              title: item.title,
              trailing: item.trailingWidget?.call(c),
            ),
          ),
        PlayPagePlayItem() => PlayListTile.forPlay(
            key: ValueKey(item.play.id),
            play: item.play,
            onTap: () => Navigator.of(ref.context).push(
              PlayDetailPage.route(play: item.play),
            ),
          )
      },
      emptyBuilder: (_) => _buildEmptyList(ref),
    );
  }

  Widget _buildEmptyList(WidgetRef ref) {
    return Center(
      child: PageImageCta(
        title: tr(LocaleKeys.plays_empty_title),
        padding: EdgeInsets.zero,
        image: Assets.images.noPlays
            .image(width: 208, height: 208, fit: BoxFit.cover),
        ctaTitle: tr(LocaleKeys.plays_empty_cta_title),
        onCtaPressed: () {
          ref.feedbackLight();
          Navigator.of(ref.context).push(PlayGamePickerPage.route());
        },
      ),
    );
  }

  List<PlayPageItem> makeItems(Iterable<PlayEntity> plays) {
    final items = <PlayPageItem>[];
    if (plays.isEmpty) return items;

    items.add(
      PlayPageTitleItem(
        tr(LocaleKeys.plays_past_plays),
        trailingWidget: (context) => AppUnderlineButton(
          title: tr(LocaleKeys.plays_add_new),
          onPressed: () => Navigator.of(context).push(
            PlayGamePickerPage.route(),
          ),
        ),
      ),
    );
    for (final play in plays) {
      items.add(PlayPagePlayItem(play));
    }
    return items;
  }
}
