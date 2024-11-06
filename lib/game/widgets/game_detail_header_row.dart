import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/widgets/icon_label.dart';
import '../../translations/locale_keys.g.dart';
import '../domain/game_detail_entity.dart';
import 'game_list_tile.dart';
import 'hexagon_container.dart';

class GameDetailHeaderRow extends StatelessWidget {
  const GameDetailHeaderRow({super.key, required this.game});

  final GameDetailEntity game;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AutoSizeText(
                game.name,
                softWrap: true,
                maxLines: 2,
                style: context.typography.headline,
              ),
              const SizedBox(height: 16),
              IntrinsicHeight(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildIconLabel(
                      context,
                      iconData: HugeIcons.strokeRoundedUserMultiple02,
                      label: game.playerCount,
                    ),
                    Visibility(
                      visible: game.complexityDouble > 0,
                      child: _buildIconLabel(
                        context,
                        iconData: HugeIcons.strokeRoundedSettings03,
                        label: game.complexityDescription,
                      ),
                    ),
                    _buildIconLabel(
                      context,
                      iconData: HugeIcons.strokeRoundedLoading01,
                      label: tr(
                        LocaleKeys.plays_detail_x_min,
                        args: [game.playingTime],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        HexagonContainer(
          fillColor: game.ratingColor(context),
          label: game.ratingDescription,
          labelStyle: context.typography.titleSmall
              .copyWith(color: context.colorScheme.onPrimary),
          padding: const EdgeInsets.all(16),
        ),
      ],
    );
  }

  Widget _buildIconLabel(
    BuildContext context, {
    required IconData iconData,
    required String label,
  }) {
    return IntrinsicWidth(
      child: IconLabel(
        iconData: iconData,
        label: label,
        backgroundColor: context.color.offWhite,
        labelColor: context.colorScheme.onSurface,
        iconColor: context.color.iconColor,
      ),
    );
  }
}
