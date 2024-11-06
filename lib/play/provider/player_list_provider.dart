import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/user_provider.dart';
import '../domain/player_entity.dart';
import '../domain/player_repository.dart';

part 'player_list_provider.g.dart';

@riverpod
class PlayerList extends _$PlayerList {
  PlayerRepository get _repository => ref.read(playerRepositoryProvider);

  @override
  Future<Iterable<PlayerEntity>> build() async {
    final userId = ref.watch(userProvider)?.id;
    if (userId == null) return [];

    final result = await _repository.getPlayerList(userId);
    return result.sorted((a, b) {
      // Sort players by name, starting with players that have a userId
      if (a.userId != null && b.userId != null) {
        return a.name.compareTo(b.name);
      } else if (a.userId != null) {
        return -1;
      } else if (b.userId != null) {
        return 1;
      } else {
        return a.name.compareTo(b.name);
      }
    });
  }

  Future<PlayerEntity> addPlayer({required String name}) async {
    state = const AsyncValue.loading();

    final userId = ref.read(userProvider)?.id;
    final player = PlayerEntity(name: name, createdBy: userId);

    try {
      await _repository.createPlayer(player);

      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }

    return player;
  }
}
