import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/widgets/app_cached_network_image.dart';
import '../../common/widgets/rounded_box.dart';
import '../../game/domain/game_detail_entity.dart';
import '../../translations/locale_keys.g.dart';
import '../domain/play_entity.dart';
import 'player_chip_row.dart';

final kPlayTileDateFormat = DateFormat('EEE, MMMM d, yyyy');

class PlayListTile extends StatelessWidget {
  const PlayListTile({
    super.key,
    required this.game,
    this.playDate,
    this.height,
    this.playerNames = const [],
    this.winnerList = const [],
    this.heroTag,
    this.onTap,
  });

  PlayListTile.forPlay({
    super.key,
    required PlayEntity play,
    this.height,
    this.onTap,
  })  : game = play.game,
        playDate = play.playDate,
        playerNames = play.sortedPlayerList.map((e) {
          if (e.userId == play.createdBy) return tr(LocaleKeys.plays_you);
          return e.name;
        }),
        winnerList = play.winnerList.map((e) {
          if (e.userId == play.createdBy) return tr(LocaleKeys.plays_you);
          return e.name;
        }),
        heroTag = play.id;

  final GameDetailEntity game;
  final DateTime? playDate;
  final Iterable<String> playerNames;
  final Iterable<String> winnerList;

  final double? height;
  final String? heroTag;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final height = this.height ?? (playerNames.isEmpty ? 80 : 104);

    Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: AppCachedNetworkImage(
        imageUrl: game.thumbnailUrl,
        fit: BoxFit.cover,
      ),
    );
    if (heroTag != null) image = Hero(tag: heroTag!, child: image);

    return SizedBox(
      height: height,
      child: RoundedBox(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        onTap: onTap,
        child: Row(
          children: [
            Expanded(child: image),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    game.name,
                    style: context.typography.titleSmall,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Visibility(
                    visible: playerNames.isEmpty,
                    child: const SizedBox(height: 4),
                  ),
                  Text(
                    playDate != null
                        ? kPlayTileDateFormat.format(playDate!)
                        : '',
                    style: context.typography.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                  const Spacer(),
                  Visibility(
                    visible: playerNames.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: PlayerChipRow(
                        playerNames: playerNames,
                        winnerList: winnerList,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
