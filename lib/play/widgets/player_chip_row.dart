import 'package:flutter/widgets.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/extensions/list_divider_ext.dart';
import '../../common/widgets/text_chip.dart';

/// A wrap of player names that will show a maximum of [playerCutoff] names.
class PlayerChipRow extends StatelessWidget {
  const PlayerChipRow({
    super.key,
    required this.playerNames,
    this.winnerList = const [],
    this.playerCutoff = 3,
  });

  final Iterable<String> playerNames;
  final Iterable<String> winnerList;

  final int playerCutoff;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...playerNames
              .take(playerCutoff)
              .map(
                (e) => TextChip(
                  text: e.toUpperCase(),
                  backgroundColor:
                      winnerList.contains(e) ? context.color.primary : null,
                ),
              )
              .divide(const SizedBox(width: 8)),
          if (playerNames.length > playerCutoff)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                '+${playerNames.length - playerCutoff}',
                style: context.typography.labelSmall,
              ),
            ),
        ],
      ),
    );
  }
}
