import '../domain/player_entity.dart';

sealed class PlayerPickerItem {}

class PlayerPickerPlayerItem extends PlayerPickerItem {
  final PlayerEntity player;
  final bool isAdded;

  PlayerPickerPlayerItem(this.player, {this.isAdded = false});
}

class PlayerPickerAddPlayerItem extends PlayerPickerItem {
  final String name;

  PlayerPickerAddPlayerItem(this.name);
}

class PlayerPickerHintItem extends PlayerPickerItem {}
