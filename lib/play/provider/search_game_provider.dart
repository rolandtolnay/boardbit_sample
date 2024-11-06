import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/debouncer.dart';
import '../../game/domain/game_repository.dart';
import '../../game/domain/search_game_entity.dart';

part 'search_game_provider.g.dart';

@riverpod
class SearchGame extends _$SearchGame {
  GameRepository get _repository => ref.read(gameRepositoryProvider);

  @override
  Future<List<SearchGameEntity>> build(String query) async {
    if (query.isEmpty) return [];

    final result = await _repository.fetchSearchGameList(query);
    return result.sorted(
      (a, b) {
        final matchA = a.queryMatch(query.toLowerCase());
        final matchB = b.queryMatch(query.toLowerCase());
        if (matchA == matchB) {
          return (b.yearPublishedInt ?? 0).compareTo(a.yearPublishedInt ?? 0);
        } else {
          return matchB.compareTo(matchA);
        }
      },
    );
  }
}

@riverpod
class SearchGameQuery extends _$SearchGameQuery {
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));

  @override
  String build() => '';

  void update(String query) {
    _debouncer.run(() => state = query);
  }
}
