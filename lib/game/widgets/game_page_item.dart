import 'package:flutter/material.dart';

import '../domain/game_detail_entity.dart';

sealed class GamePageItem {}

class GamePageTitleItem extends GamePageItem {
  final String title;
  final WidgetBuilder? trailingWidget;

  GamePageTitleItem(this.title, {this.trailingWidget});
}

class GamePageGameItem extends GamePageItem {
  final GameDetailEntity game;

  GamePageGameItem(this.game);
}
