import 'package:json_annotation/json_annotation.dart';

import '../../common/searchable.dart';
import 'game_detail_entity.dart';

part 'search_game_entity.g.dart';

@JsonSerializable(createToJson: false)
class SearchGameEntity implements Searchable {
  @JsonKey(name: 'id')
  final String bggId;
  @JsonKey(readValue: GameDetailEntity.readName)
  final String name;
  @JsonKey(name: 'yearpublished')
  final String? yearPublished;

  SearchGameEntity({
    required this.bggId,
    required this.name,
    this.yearPublished,
  });

  factory SearchGameEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchGameEntityFromJson(json);

  factory SearchGameEntity.stub() => SearchGameEntity(
        bggId: '',
        name: 'Stub Game',
        yearPublished: '2024',
      );

  int? get yearPublishedInt => int.tryParse(yearPublished ?? '');

  @override
  int queryMatch(String query) {
    if (query.isEmpty) return 1;

    final name = this.name.toLowerCase();
    if (name == query) return 3;
    if (name.startsWith(query)) return 2;
    if (name.contains(query)) return 1;

    return 0;
  }
}
