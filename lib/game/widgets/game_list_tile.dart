import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/widgets/app_cached_network_image.dart';
import '../../common/widgets/icon_label.dart';
import '../../common/widgets/rounded_box.dart';
import '../domain/game_detail_entity.dart';
import 'hexagon_container.dart';

class GameListTile extends StatelessWidget {
  const GameListTile({
    super.key,
    required this.game,
    this.imageHeight,
    this.showDescription = true,
    this.nameMaxLines = 1,
  });

  final GameDetailEntity game;

  final double? imageHeight;
  final bool showDescription;
  final int nameMaxLines;

  @override
  Widget build(BuildContext context) {
    final imageHeight = this.imageHeight ?? context.screenHeight * 0.15;

    return RoundedBox(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              height: imageHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.hardEdge,
                child: AppCachedNetworkImage(
                  imageUrl: game.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        game.name,
                        style: context.typography.titleSmall,
                        maxLines: nameMaxLines,
                        softWrap: nameMaxLines > 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(width: 8),
                    HexagonContainer(
                      fillColor: game.ratingColor(context),
                      label: game.ratingDescription,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: showDescription,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      game.description,
                      style: context.typography.bodyMedium.copyWith(
                        height: 20 / 14,
                      ),
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconLabel(
                      iconData: HugeIcons.strokeRoundedUserMultiple02,
                      label: game.playerCount,
                    ),
                    Visibility(
                      visible: game.complexityDouble > 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconLabel(
                          iconData: HugeIcons.strokeRoundedSettings03,
                          label: game.complexityDescription,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension GameRatingColor on GameDetailEntity {
  Color ratingColor(BuildContext context) {
    final rating = double.tryParse(this.rating) ?? 0;
    return switch (rating) {
      > 8.0 && <= 10 => context.color.primaryDark,
      > 6.5 && <= 8.0 => context.color.primary,
      _ => context.color.primaryLight,
    };
  }
}
