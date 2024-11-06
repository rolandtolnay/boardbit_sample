import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../game/game_page.dart';
import '../play/plays_page.dart';
import '../translations/locale_keys.g.dart';

final appTabProvider = StateProvider<AppTab>((_) => AppTab.games);

enum AppTab {
  games,
  plays;

  Widget buildWidget() => switch (this) {
        AppTab.games => const GamePage(),
        AppTab.plays => const HistoryPage()
      };

  Widget buildIcon({required Color color, double size = 24.0}) {
    final icon = switch (this) {
      AppTab.games => HugeIcons.strokeRoundedDice,
      AppTab.plays => HugeIcons.strokeRoundedLeftToRightListDash,
    };

    return HugeIcon(icon: icon, color: color, size: size);
  }

  String get text => switch (this) {
        AppTab.games => tr(LocaleKeys.games_title),
        AppTab.plays => tr(LocaleKeys.plays_title),
      };
}
