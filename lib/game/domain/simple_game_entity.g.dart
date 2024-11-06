// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_game_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleGameEntity _$SimpleGameEntityFromJson(Map<String, dynamic> json) =>
    SimpleGameEntity(
      json['id'] as String,
      GameDetailEntity.readName(json, 'name') as String,
      json['thumbnail'] as String,
      json['yearpublished'] as String,
    );

const _$SimpleGameEntityFieldMap = <String, String>{
  'bggId': 'id',
  'name': 'name',
  'thumbnailUrl': 'thumbnail',
  'yearPublished': 'yearpublished',
};

// ignore: unused_element
abstract class _$SimpleGameEntityPerFieldToJson {
  // ignore: unused_element
  static Object? bggId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? thumbnailUrl(String instance) => instance;
  // ignore: unused_element
  static Object? yearPublished(String instance) => instance;
}
