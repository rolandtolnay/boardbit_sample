import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../common/extensions/build_context_ext.dart';
import '../common/haptic_provider.dart';
import '../common/widgets/app_confirmation_sheet.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/button/app_small_primary_button.dart';
import '../common/widgets/button/app_underline_button.dart';
import '../common/widgets/flexible_image_scaffold.dart';
import '../common/widgets/rounded_box.dart';
import '../game/domain/game_detail_entity.dart';
import '../game/widgets/game_detail_header_image.dart';
import '../game/widgets/game_detail_header_row.dart';
import '../translations/locale_keys.g.dart';
import 'domain/play_entity.dart';
import 'provider/play_provider.dart';
import 'provider/single_play_provider.dart';
import 'provider/user_player_provider.dart';
import 'widgets/play_detail_date_widget.dart';
import 'widgets/play_score_sheet.dart';
import 'widgets/player_score_row.dart';

class PlayDetailPage extends HookConsumerWidget {
  const PlayDetailPage({super.key, required this.play});

  static Route<dynamic> route({required PlayEntity play}) {
    return MaterialPageRoute(builder: (_) => PlayDetailPage(play: play));
  }

  final PlayEntity play;

  GameDetailEntity get game => play.game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlayer = ref.watch(userPlayerProvider).valueOrNull;
    final play =
        ref.watch(singlePlayProvider(this.play.id)).valueOrNull ?? this.play;

    final deleteButton = AppSmallPrimaryButton(
      title: tr(LocaleKeys.plays_delete_play),
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedDelete03,
        color: context.color.primary,
      ),
      onPressed: () async {
        ref.feedbackSelection();

        final confirm = await AppConfirmationSheet.show(
          context,
          description: tr(LocaleKeys.plays_delete_disclaimer),
          positiveTitle: tr(LocaleKeys.plays_delete_play),
          negativeTitle: tr(LocaleKeys.common_cancel),
        );
        if (confirm ?? false) {
          await ref.read(playProvider.notifier).deletePlay(play.id);
          if (context.mounted) Navigator.of(context).pop();
        }
      },
    );

    final detailBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GameDetailHeaderRow(game: game),
        const SizedBox(height: 24),
        PlayDetailDateWidget(play: play),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Text(
                tr(LocaleKeys.plays_detail_players),
                style: context.typography.titleSmall.copyWith(height: 28 / 18),
              ),
            ),
            const SizedBox(width: 16),
            AppUnderlineButton(
              title: tr(LocaleKeys.plays_detail_edit_score),
              onPressed: () => PlayScoreSheet.show(context, play: play),
            ),
          ],
        ),
        const SizedBox(height: 12),
        RoundedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...play.sortedPlayerList.mapIndexed(
                (index, player) => PlayerScoreRow(
                  player: player,
                  play: play,
                  isUserPlayer: userPlayer?.userId == player.userId,
                  padding: EdgeInsets.only(
                    top: index > 0 ? 12 : 0,
                    bottom: index < play.playerList.length - 1 ? 12 : 0,
                  ),
                  hasBottomDivider: index < play.playerList.length - 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Align(child: deleteButton),
        SizedBox(height: context.bottomSafeArea + 32),
      ],
    );

    return FlexibleImageScaffold(
      flexibleWidget: GameDetailHeaderImage(game: game, heroTag: play.id),
      safeAreaValues: const SafeAreaValues(top: false, bottom: false),
      bodySliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: detailBody,
        ),
      ),
    );
  }
}
