// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_game_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGameEntity _$SearchGameEntityFromJson(Map<String, dynamic> json) =>
    SearchGameEntity(
      bggId: json['id'] as String,
      name: GameDetailEntity.readName(json, 'name') as String,
      yearPublished: json['yearpublished'] as String?,
    );

const _$SearchGameEntityFieldMap = <String, String>{
  'bggId': 'id',
  'name': 'name',
  'yearPublished': 'yearpublished',
};

// ignore: unused_element
abstract class _$SearchGameEntityPerFieldToJson {
  // ignore: unused_element
  static Object? bggId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? yearPublished(String? instance) => instance;
}
