import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/user_provider.dart';
import '../domain/player_entity.dart';
import '../domain/player_repository.dart';

part 'user_player_provider.g.dart';

@riverpod
class UserPlayer extends _$UserPlayer {
  PlayerRepository get _repository => ref.read(playerRepositoryProvider);

  @override
  Future<PlayerEntity?> build() async {
    final userId = ref.watch(userProvider)?.id;
    if (userId == null) return null;

    return _repository.getUserPlayer(userId);
  }

  Future<void> createUserPlayer() async {
    if (state.isLoading) return;

    final user = ref.watch(userProvider);
    if (user == null) return Future.value();

    state = const AsyncValue.loading();

    try {
      await _repository.createPlayer(PlayerEntity.forUser(user));

      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
