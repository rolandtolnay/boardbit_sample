import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'play_entity.dart';

part 'play_repository.g.dart';

abstract class PlayRepository {
  Future<Iterable<PlayEntity>> fetchPlayList(String userId);

  Future<PlayEntity?> fetchPlay(String playId);

  Future<void> savePlay(PlayEntity play);

  Future<void> deletePlay(String playId);
}

class FirPlayRepository implements PlayRepository {
  @override
  Future<Iterable<PlayEntity>> fetchPlayList(String userId) async {
    final snap = await playsRef.whereUserIdList(arrayContains: userId).get();
    final result = snap.docs.map((e) => e.data).sorted((a, b) {
      return b.playDate.compareTo(a.playDate);
    });
    return result;
  }

  @override
  Future<PlayEntity?> fetchPlay(String playId) async {
    final snap = await playsRef.doc(playId).get();
    return snap.data;
  }

  @override
  Future<void> savePlay(PlayEntity play) async {
    await playsRef.doc(play.id).set(play);
  }

  @override
  Future<void> deletePlay(String playId) async {
    await playsRef.doc(playId).delete();
  }
}

@riverpod
PlayRepository playRepository(PlayRepositoryRef ref) => FirPlayRepository();
