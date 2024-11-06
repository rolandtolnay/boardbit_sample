import 'package:flutter/material.dart';

import '../domain/play_entity.dart';

sealed class PlayPageItem {}

class PlayPageTitleItem extends PlayPageItem {
  final String title;
  final WidgetBuilder? trailingWidget;

  PlayPageTitleItem(this.title, {this.trailingWidget});
}

class PlayPagePlayItem extends PlayPageItem {
  final PlayEntity play;

  PlayPagePlayItem(this.play);
}
