import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/data/api_endpoint.dart';
import '../../common/data/dio_provider.dart';
import 'game_detail_entity.dart';
import 'hot_game_entity.dart';
import 'search_game_entity.dart';
import 'simple_game_entity.dart';

part 'game_repository.g.dart';

abstract class GameRepository {
  Future<Iterable<HotGameEntity>> fetchHotGameList();

  Future<Iterable<GameDetailEntity>> fetchGameDetailList(
    Iterable<String> idList,
  );

  Future<Iterable<SimpleGameEntity>> fetchSimpleGameList(
    Iterable<String> idList,
  );

  Future<Iterable<SearchGameEntity>> fetchSearchGameList(String query);
}

const _kBggThingCap = 20;

class GameRepositoryImpl implements GameRepository {
  final Dio dio;

  GameRepositoryImpl(this.dio);

  @override
  Future<Iterable<HotGameEntity>> fetchHotGameList() async {
    final response = await dio.get<Map<String, dynamic>>(ApiEndpoint.hotGames);

    if (response.data == null) return [];
    final items = response.data!['items'] as List<dynamic>;

    final result = items
        .map((e) => HotGameEntity.fromJson(e as Map<String, dynamic>))
        .toList(); // forces eager evaluation
    return result;
  }

  @override
  Future<Iterable<GameDetailEntity>> fetchGameDetailList(
    Iterable<String> idList,
  ) async {
    final cappedIdList = idList.take(_kBggThingCap);
    final response = await dio.get<Map<String, dynamic>>(
      ApiEndpoint.thing(cappedIdList),
    );

    if (response.data == null) return [];
    Iterable<GameDetailEntity> result = [];
    final items = response.data!['items'];
    if (items is List<dynamic>) {
      result = items
          .map((e) => GameDetailEntity.fromJson(e as Map<String, dynamic>))
          .toList(); // forces eager evaluation
    } else if (items is Map<String, dynamic>) {
      if (items.containsKey('id')) {
        result = [GameDetailEntity.fromJson(items)];
      }
      // empty list comes back as map with 2 keys
    }
    return result;
  }

  @override
  Future<Iterable<SimpleGameEntity>> fetchSimpleGameList(
    Iterable<String> idList,
  ) async {
    final cappedIdList = idList.take(_kBggThingCap);
    final response = await dio.get<Map<String, dynamic>>(
      ApiEndpoint.thing(cappedIdList, includeStats: false),
    );

    if (response.data == null) return [];

    Iterable<SimpleGameEntity> result = [];
    final items = response.data!['items'];
    if (items is List<dynamic>) {
      result = items
          .map((e) => SimpleGameEntity.fromJson(e as Map<String, dynamic>))
          .toList(); // forces eager evaluation
    } else if (items is Map<String, dynamic>) {
      if (items.containsKey('id')) {
        result = [SimpleGameEntity.fromJson(items)];
      }
      // empty list comes back as map with 2 keys
    }
    return result;
  }

  @override
  Future<Iterable<SearchGameEntity>> fetchSearchGameList(String query) async {
    final sanitized = query.replaceAll(' ', '+').trim().toLowerCase();
    final response = await dio.get<Map<String, dynamic>>(
      ApiEndpoint.search(sanitized),
    );

    if (response.data == null) return [];

    Iterable<SearchGameEntity> result = [];
    final items = response.data!['items'];
    if (items is List<dynamic>) {
      result = items
          .map((e) => SearchGameEntity.fromJson(e as Map<String, dynamic>))
          .toList(); // forces eager evaluation
    } else if (items is Map<String, dynamic>) {
      if (items.containsKey('id')) {
        result = [SearchGameEntity.fromJson(items)];
      }
      // empty list comes back as map with 2 keys
    }
    return result;
  }
}

@riverpod
GameRepository gameRepository(GameRepositoryRef ref) =>
    GameRepositoryImpl(ref.watch(dioProvider));
