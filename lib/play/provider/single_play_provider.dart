import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/play_entity.dart';
import '../domain/play_repository.dart';
import '../domain/player_score.dart';

part 'single_play_provider.g.dart';

@riverpod
class SinglePlay extends _$SinglePlay {
  PlayRepository get _repository => ref.read(playRepositoryProvider);

  @override
  Future<PlayEntity?> build(String playId) => _repository.fetchPlay(playId);

  Future<void> updateScore(PlayerScore score) async {
    if (state.valueOrNull == null || state.hasError) return;

    state = const AsyncValue.loading();

    final value = state.requireValue!;

    var updatedList = List<PlayerScore>.from(value.scoreList);
    final hadScore = value.scoreList.any((e) => e.playerId == score.playerId);
    if (hadScore) {
      updatedList = value.scoreList
          .map((e) => e.playerId == score.playerId ? score : e)
          .toList();
    } else {
      updatedList.add(score);
    }

    final entity = value.copyWith(scoreList: updatedList);

    try {
      await _repository.savePlay(entity);

      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
