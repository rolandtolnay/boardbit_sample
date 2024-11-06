import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/theme/app_animation.dart';
import '../../common/use_init_hook.dart';
import '../../common/widgets/app_bottom_sheet.dart';
import '../../common/widgets/keyboard_focus_detector.dart';
import '../domain/play_entity.dart';
import '../domain/player_entity.dart';
import '../provider/single_play_provider.dart';
import 'player_score_input_page.dart';

class PlayScoreSheet extends HookConsumerWidget {
  const PlayScoreSheet({super.key, required this.play, this.selectedPlayer});

  final PlayEntity play;
  final PlayerEntity? selectedPlayer;

  static Future<void> show(
    BuildContext context, {
    required PlayEntity play,
    PlayerEntity? selectedPlayer,
  }) {
    return showAppModalBottomSheet<void>(
      context: context,
      builder: (_) => PlayScoreSheet(
        play: play,
        selectedPlayer: selectedPlayer,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetHeight = 240.0 + context.keyboardHeight + context.bottomSafeArea;

    final play = ref.watch(singlePlayProvider(this.play.id)).valueOrNull;
    if (play == null) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: sheetHeight),
        child: const SizedBox.expand(),
      );
    }

    // Copy and save list so order doesnt change when updating scores / rebuilding
    final playerList = useMemoized(
      () => List<PlayerEntity>.from(play.sortedPlayerList),
    );
    final pageCount = play.playerList.length;

    final focusNodeMap = useMemoized(() => <String, FocusNode>{});
    for (final player in playerList) {
      focusNodeMap[player.id] = useFocusNode();
    }

    final initialPage = max(
      playerList.indexWhere((e) => e.id == selectedPlayer?.id),
      0,
    );
    final pageController = usePageController(initialPage: initialPage);
    useAsyncEffectDisposing(() async {
      void onPageChanged() {
        final page = pageController.page ?? 0;
        if (page % 1 == 0) {
          final player = playerList[page.toInt()];
          focusNodeMap[player.id]?.requestFocus();
        }
      }

      // provides smoother experience than `PageView.onPageChanged`
      pageController.addListener(onPageChanged);
      return () => pageController.removeListener(onPageChanged);
    });

    return KeyboardFocusDetector(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: sheetHeight),
        child: PageView(
          controller: pageController,
          children: [
            ...playerList.mapIndexed(
              (index, player) {
                final score = play.scoreList
                    .firstWhereOrNull((e) => e.playerId == player.id);
                return PlayerScoreInputPage(
                  score: score,
                  player: player,
                  inputFocusNode: focusNodeMap[player.id],
                  onScoreChanged: (newScore) => ref
                      .read(singlePlayProvider(play.id).notifier)
                      .updateScore(newScore),
                  onPageChangeRequest: (direction) {
                    final enabled = pageController.directionEnabled(
                      direction,
                      pageCount: pageCount,
                    );
                    if (enabled) pageController.animateDirection(direction);
                  },
                  directionEnabled: (direction) => pageController
                      .directionEnabled(direction, pageCount: pageCount),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension on PageController {
  bool directionEnabled(PageDirection direction, {required int pageCount}) {
    if (!position.haveDimensions) return true;

    final currentPage = (page ?? 0).round();
    return switch (direction) {
      PageDirection.backward => currentPage > 0,
      PageDirection.forward => currentPage < pageCount - 1
    };
  }

  void animateDirection(PageDirection direction) {
    const duration = AppAnimation.durationNormal;
    const curve = AppAnimation.curveStandard;
    switch (direction) {
      case PageDirection.backward:
        previousPage(duration: duration, curve: curve);
      case PageDirection.forward:
        nextPage(duration: duration, curve: curve);
    }
  }
}
