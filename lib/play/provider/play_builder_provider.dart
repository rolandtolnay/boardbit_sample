import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/extensions/date_time_ext.dart';
import '../../game/domain/game_detail_entity.dart';
import '../../game/domain/search_game_entity.dart';
import '../domain/play_entity.dart';
import '../domain/player_entity.dart';

part 'play_builder_provider.g.dart';

@riverpod
class PlayBuilder extends _$PlayBuilder {
  @override
  PlayBuilderState build() => PlayBuilderState();

  void setGame(SearchGameEntity game) => state = state.copyWith(game: game);

  void setDate(DateTime date) => state = state.copyWith(date: date);

  void addPlayer(PlayerEntity player) {
    state = state.copyWith(
      playerList: {...state.playerList, player}.toList(),
    );
  }

  void removePlayer(PlayerEntity player) {
    state = state.copyWith(
      playerList: state.playerList.where((e) => e != player).toList(),
    );
  }
}

class PlayBuilderState {
  final SearchGameEntity? game;
  final DateTime? date;
  final List<PlayerEntity> playerList;

  PlayBuilderState({
    this.game,
    DateTime? date,
    this.playerList = const [],
  }) : date = date ?? DateTime.now().startOfDay;

  PlayBuilderState copyWith({
    SearchGameEntity? game,
    DateTime? date,
    List<PlayerEntity>? playerList,
  }) {
    return PlayBuilderState(
      game: game ?? this.game,
      date: date ?? this.date,
      playerList: playerList ?? this.playerList,
    );
  }

  PlayEntity? makeEntity({
    required GameDetailEntity game,
    required String createdBy,
  }) {
    if (date == null || playerList.isEmpty) return null;

    return PlayEntity(
      game: game,
      playDate: date,
      playerList: playerList,
      createdBy: createdBy,
    );
  }
}
