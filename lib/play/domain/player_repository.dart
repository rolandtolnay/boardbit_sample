import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'player_entity.dart';

part 'player_repository.g.dart';

abstract class PlayerRepository {
  Future<void> createPlayer(PlayerEntity player);

  Future<PlayerEntity?> getUserPlayer(String userId);

  Future<Iterable<PlayerEntity>> getPlayerList(String userId);
}

class FirPlayerRepository implements PlayerRepository {
  @override
  Future<void> createPlayer(PlayerEntity player) async {
    await playersRef.doc(player.id).set(player);
  }

  @override
  Future<Iterable<PlayerEntity>> getPlayerList(String userId) async {
    final snap = await playersRef.whereCreatedBy(isEqualTo: userId).get();
    final result = snap.docs.map((e) => e.data).toList();
    return result;
  }

  @override
  Future<PlayerEntity?> getUserPlayer(String userId) async {
    final snap = await playersRef.whereUserId(isEqualTo: userId).get();
    return snap.docs.isNotEmpty ? snap.docs.first.data : null;
  }
}

@riverpod
PlayerRepository playerRepository(PlayerRepositoryRef ref) =>
    FirPlayerRepository();
