// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetailEntity _$GameDetailEntityFromJson(Map<String, dynamic> json) =>
    GameDetailEntity(
      bggId: json['id'] as String,
      name: GameDetailEntity.readName(json, 'name') as String,
      thumbnailUrl: json['thumbnail'] as String? ?? '',
      imageUrl: json['image'] as String? ?? '',
      description: json['description'] as String? ?? '',
      yearPublished: json['yearpublished'] as String? ?? '',
      minPlayers: json['minplayers'] as String? ?? '1',
      maxPlayers: json['maxplayers'] as String? ?? '',
      rating: GameDetailEntity._readStatistic(json, 'average') as String,
      bayesRating:
          GameDetailEntity._readStatistic(json, 'bayesaverage') as String,
      usersRated: GameDetailEntity._readStatistic(json, 'usersrated') as String,
      complexity:
          GameDetailEntity._readStatistic(json, 'averageweight') as String,
      playingTime: json['playingtime'] as String,
    );

const _$GameDetailEntityFieldMap = <String, String>{
  'bggId': 'id',
  'name': 'name',
  'thumbnailUrl': 'thumbnail',
  'imageUrl': 'image',
  'description': 'description',
  'yearPublished': 'yearpublished',
  'minPlayers': 'minplayers',
  'maxPlayers': 'maxplayers',
  'rating': 'average',
  'bayesRating': 'bayesaverage',
  'usersRated': 'usersrated',
  'complexity': 'averageweight',
  'playingTime': 'playingtime',
};

// ignore: unused_element
abstract class _$GameDetailEntityPerFieldToJson {
  // ignore: unused_element
  static Object? bggId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? thumbnailUrl(String instance) => instance;
  // ignore: unused_element
  static Object? imageUrl(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? yearPublished(String instance) => instance;
  // ignore: unused_element
  static Object? minPlayers(String instance) => instance;
  // ignore: unused_element
  static Object? maxPlayers(String instance) => instance;
  // ignore: unused_element
  static Object? rating(String instance) => instance;
  // ignore: unused_element
  static Object? bayesRating(String instance) => instance;
  // ignore: unused_element
  static Object? usersRated(String instance) => instance;
  // ignore: unused_element
  static Object? complexity(String instance) => instance;
  // ignore: unused_element
  static Object? playingTime(String instance) => instance;
}

Map<String, dynamic> _$GameDetailEntityToJson(GameDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.bggId,
      'name': instance.name,
      'thumbnail': instance.thumbnailUrl,
      'image': instance.imageUrl,
      'description': instance.description,
      'yearpublished': instance.yearPublished,
      'minplayers': instance.minPlayers,
      'maxplayers': instance.maxPlayers,
      'average': instance.rating,
      'bayesaverage': instance.bayesRating,
      'usersrated': instance.usersRated,
      'averageweight': instance.complexity,
      'playingtime': instance.playingTime,
    };

GameNameVariation _$GameNameVariationFromJson(Map<String, dynamic> json) =>
    GameNameVariation(
      json['type'] as String,
      json['sortindex'] as String,
      json['value'] as String,
    );

const _$GameNameVariationFieldMap = <String, String>{
  'type': 'type',
  'sortIndex': 'sortindex',
  'value': 'value',
};

// ignore: unused_element
abstract class _$GameNameVariationPerFieldToJson {
  // ignore: unused_element
  static Object? type(String instance) => instance;
  // ignore: unused_element
  static Object? sortIndex(String instance) => instance;
  // ignore: unused_element
  static Object? value(String instance) => instance;
}
