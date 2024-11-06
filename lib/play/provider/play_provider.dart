import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/user_provider.dart';
import '../domain/play_entity.dart';
import '../domain/play_repository.dart';

part 'play_provider.g.dart';

@Riverpod(keepAlive: true)
class Play extends _$Play {
  PlayRepository get _repository => ref.read(playRepositoryProvider);

  @override
  Future<Iterable<PlayEntity>> build() async {
    final userId = ref.watch(userProvider)?.id;
    if (userId == null) return [];

    final result = await _repository.fetchPlayList(userId);
    // improves loading UX on page, don't try this at home
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return result;
  }

  Future<void> savePlay(PlayEntity play) async {
    state = const AsyncValue.loading();

    try {
      await _repository.savePlay(play);

      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deletePlay(String playId) async {
    state = const AsyncValue.loading();

    try {
      await _repository.deletePlay(playId);

      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
