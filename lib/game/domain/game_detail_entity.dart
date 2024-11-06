import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_detail_entity.g.dart';

@JsonSerializable()
class GameDetailEntity {
  @JsonKey(name: 'id')
  final String bggId;
  @JsonKey(readValue: readName)
  final String name;

  @JsonKey(defaultValue: '', name: 'thumbnail')
  final String thumbnailUrl;
  @JsonKey(defaultValue: '', name: 'image')
  final String imageUrl;

  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '', name: 'yearpublished')
  final String yearPublished;

  @JsonKey(defaultValue: '1', name: 'minplayers')
  final String minPlayers;
  @JsonKey(defaultValue: '', name: 'maxplayers')
  final String maxPlayers;

  @JsonKey(name: 'average', readValue: _readStatistic)
  final String rating;
  @JsonKey(name: 'bayesaverage', readValue: _readStatistic)
  final String bayesRating;
  @JsonKey(name: 'usersrated', readValue: _readStatistic)
  final String usersRated;

  @JsonKey(name: 'averageweight', readValue: _readStatistic)
  final String complexity;

  @JsonKey(name: 'playingtime')
  final String playingTime;

  GameDetailEntity({
    required this.bggId,
    required this.name,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.description,
    required this.yearPublished,
    required this.minPlayers,
    required this.maxPlayers,
    required this.rating,
    required this.bayesRating,
    required this.usersRated,
    required this.complexity,
    required this.playingTime,
  });

  factory GameDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$GameDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GameDetailEntityToJson(this);

  static Object? readName(Map<dynamic, dynamic> map, String key) {
    final name = map[key];
    if (name is List<dynamic>) {
      final list = name;
      final variationList = list.map(
        (e) => GameNameVariation.fromJson(e as Map<String, dynamic>),
      );
      return variationList.firstWhereOrNull((e) => e.type == 'primary')?.value;
    } else if (name is Map<String, dynamic>) {
      return name['value'] as Object?;
    } else if (name is String) {
      return name;
    }
    return null;
  }

  static Object? _readStatistic(Map<dynamic, dynamic> map, String key) {
    if (map[key] != null) return map[key];

    final statistics = map['statistics'] as Map<String, dynamic>;
    final ratings = statistics['ratings'] as Map<String, dynamic>;
    return ratings[key] as Object?;
  }

  String get ratingDescription =>
      double.tryParse(rating)?.toStringAsFixed(1) ?? rating;

  String get complexityDescription =>
      double.tryParse(complexity)?.toStringAsFixed(2) ?? complexity;

  double get complexityDouble => double.tryParse(complexity) ?? 0;

  String get playerCount {
    if (minPlayers == maxPlayers) return minPlayers;
    return '$minPlayers - $maxPlayers';
  }

  /// Used for skeletonizer
  factory GameDetailEntity.stub({String? name}) => GameDetailEntity(
        bggId: '',
        name: name ?? 'Stub Game',
        thumbnailUrl: '',
        imageUrl: '',
        description:
            'Stub description that is very long and should be truncated',
        yearPublished: '2024',
        minPlayers: '1',
        maxPlayers: '4',
        rating: '7.5',
        bayesRating: '7.5',
        usersRated: '',
        complexity: '3.2',
        playingTime: '480',
      );
}

@JsonSerializable(createToJson: false)
class GameNameVariation {
  final String type;
  @JsonKey(name: 'sortindex')
  final String sortIndex;
  final String value;

  GameNameVariation(this.type, this.sortIndex, this.value);

  factory GameNameVariation.fromJson(Map<String, dynamic> json) =>
      _$GameNameVariationFromJson(json);
}
