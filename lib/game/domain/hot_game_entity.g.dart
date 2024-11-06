// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_game_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotGameEntity _$HotGameEntityFromJson(Map<String, dynamic> json) =>
    HotGameEntity(
      json['id'] as String,
      json['name'] as String,
      json['thumbnail'] as String,
      json['yearpublished'] as String,
      HotGameEntity._parseRank(json['rank']),
    );

const _$HotGameEntityFieldMap = <String, String>{
  'bggId': 'id',
  'name': 'name',
  'thumbnailUrl': 'thumbnail',
  'yearPublished': 'yearpublished',
  'rank': 'rank',
};

// ignore: unused_element
abstract class _$HotGameEntityPerFieldToJson {
  // ignore: unused_element
  static Object? bggId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? thumbnailUrl(String instance) => instance;
  // ignore: unused_element
  static Object? yearPublished(String instance) => instance;
  // ignore: unused_element
  static Object? rank(int instance) => instance;
}

Map<String, dynamic> _$HotGameEntityToJson(HotGameEntity instance) =>
    <String, dynamic>{
      'id': instance.bggId,
      'name': instance.name,
      'thumbnail': instance.thumbnailUrl,
      'yearpublished': instance.yearPublished,
      'rank': instance.rank,
    };
