// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerScore _$PlayerScoreFromJson(Map<String, dynamic> json) => PlayerScore(
      id: json['id'] as String?,
      playerId: json['playerId'] as String,
      scoreParts: (json['scoreParts'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

const _$PlayerScoreFieldMap = <String, String>{
  'id': 'id',
  'playerId': 'playerId',
  'scoreParts': 'scoreParts',
};

// ignore: unused_element
abstract class _$PlayerScorePerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? playerId(String instance) => instance;
  // ignore: unused_element
  static Object? scoreParts(List<int> instance) => instance;
}

Map<String, dynamic> _$PlayerScoreToJson(PlayerScore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playerId': instance.playerId,
      'scoreParts': instance.scoreParts,
    };
