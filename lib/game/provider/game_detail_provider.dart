import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/game_detail_entity.dart';
import '../domain/game_repository.dart';

part 'game_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class GameDetail extends _$GameDetail {
  GameRepository get _repository => ref.read(gameRepositoryProvider);

  @override
  Future<GameDetailEntity?> build(String bggId) async {
    if (bggId.isEmpty) return null;

    final result = await _repository.fetchGameDetailList([bggId]);
    return result.firstOrNull;
  }
}
