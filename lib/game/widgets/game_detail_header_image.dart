import 'package:flutter/material.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/widgets/app_cached_network_image.dart';
import '../domain/game_detail_entity.dart';

class GameDetailHeaderImage extends StatelessWidget {
  const GameDetailHeaderImage({super.key, required this.game, this.heroTag});

  final GameDetailEntity game;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AppCachedNetworkImage(
        imageUrl: game.imageUrl,
        fit: BoxFit.contain,
        errorWidget: (_, __, ___) => Container(
          decoration: BoxDecoration(
            gradient: context.color.primaryGradientDisabled,
          ),
        ),
      ),
    );
    if (heroTag != null) image = Hero(tag: heroTag!, child: image);

    return ColoredBox(
      color: const Color(0xff3567B2),
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: context.color.primaryGradientDark,
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
