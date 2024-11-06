import 'package:json_annotation/json_annotation.dart';

import 'game_detail_entity.dart';

part 'simple_game_entity.g.dart';

@JsonSerializable(createToJson: false)
class SimpleGameEntity {
  @JsonKey(name: 'id')
  final String bggId;
  @JsonKey(readValue: GameDetailEntity.readName)
  final String name;
  @JsonKey(name: 'thumbnail')
  final String thumbnailUrl;
  @JsonKey(name: 'yearpublished')
  final String yearPublished;

  SimpleGameEntity(
    this.bggId,
    this.name,
    this.thumbnailUrl,
    this.yearPublished,
  );

  factory SimpleGameEntity.fromJson(Map<String, dynamic> json) =>
      _$SimpleGameEntityFromJson(json);
}
