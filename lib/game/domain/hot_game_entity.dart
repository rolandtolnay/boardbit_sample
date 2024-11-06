import 'package:json_annotation/json_annotation.dart';

part 'hot_game_entity.g.dart';

@JsonSerializable()
class HotGameEntity {
  @JsonKey(name: 'id')
  final String bggId;
  final String name;

  @JsonKey(name: 'thumbnail')
  final String thumbnailUrl;
  @JsonKey(name: 'yearpublished')
  final String yearPublished;

  @JsonKey(fromJson: _parseRank)
  final int rank;

  HotGameEntity(
    this.bggId,
    this.name,
    this.thumbnailUrl,
    this.yearPublished,
    this.rank,
  );

  factory HotGameEntity.fromJson(Map<String, dynamic> json) =>
      _$HotGameEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HotGameEntityToJson(this);

  static int _parseRank(dynamic value) {
    if (value is int) return value;
    return int.parse(value.toString());
  }
}
