import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/game_detail_entity.dart';
import '../domain/game_repository.dart';

part 'hot_game_provider.g.dart';

@Riverpod(keepAlive: true)
class HotGame extends _$HotGame {
  GameRepository get _repository => ref.read(gameRepositoryProvider);

  @override
  Future<Iterable<GameDetailEntity>> build() async {
    final hotGames = await _repository.fetchHotGameList();

    final top15 = hotGames.take(15);

    final detail = await _repository.fetchGameDetailList(
      top15.map((e) => e.bggId),
    );
    return detail;
  }
}
