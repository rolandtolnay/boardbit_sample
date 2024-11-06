import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/widgets/app_divider.dart';
import '../../gen/assets.gen.dart';
import '../../translations/locale_keys.g.dart';
import '../domain/play_entity.dart';
import '../domain/player_entity.dart';
import '../domain/player_score.dart';
import 'play_score_sheet.dart';

class PlayerScoreRow extends StatelessWidget {
  const PlayerScoreRow({
    super.key,
    required this.player,
    required this.play,
    this.hasBottomDivider = false,
    this.isUserPlayer = false,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
  });

  final PlayerEntity player;
  final PlayEntity play;

  final bool isUserPlayer;
  final bool hasBottomDivider;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final score = play.scoreList.firstWhereOrNull(
      (e) => e.playerId == player.id,
    );
    final scoreParts = score?.scoreParts ?? [];

    final isWinner = play.winnerList.contains(player);
    final leadingIcon = isWinner
        ? Assets.icons.crown.svg(
            width: 18,
            height: 18,
            colorFilter: context.color.neutral600.filter,
          )
        : HugeIcon(
            icon: HugeIcons.strokeRoundedUser,
            color: context.color.neutral600,
            size: 18,
          );

    const cardHeight = 20.0;
    final partsColor = scoreParts.isEmpty ? context.color.primaryLight : null;

    final scoreCard = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          player.name + (isUserPlayer ? tr(LocaleKeys.plays_detail_you) : ''),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.typography.bodyMedium.copyWith(
            fontWeight: isWinner ? FontWeight.w800 : FontWeight.w600,
            color: context.color.iconColor,
            height: cardHeight / 14,
          ),
        ),
        const SizedBox(height: 4),
        Flexible(
          child: Text(
            scoreParts.isEmpty
                ? tr(LocaleKeys.plays_detail_tap_to_add)
                : scoreParts.join(' + '),
            style: context.typography.bodyMedium.copyWith(
              height: cardHeight / 12,
              color: partsColor,
              fontSize: 12,
              fontFeatures: [const FontFeature.tabularFigures()],
            ),
            softWrap: true,
          ),
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => PlayScoreSheet.show(
            context,
            play: play,
            selectedPlayer: player,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: padding,
              child: Row(
                children: [
                  leadingIcon,
                  const SizedBox(width: 16, height: cardHeight),
                  Expanded(child: scoreCard),
                  const SizedBox(width: 16, height: cardHeight),
                  Text(
                    score?.totalScore.toString() ?? '',
                    style: context.typography.titleSmall.copyWith(
                      height: cardHeight / 18,
                      fontWeight: FontWeight.w700,
                      fontFeatures: [const FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (hasBottomDivider) const AppDivider(height: 8),
      ],
    );
  }
}
