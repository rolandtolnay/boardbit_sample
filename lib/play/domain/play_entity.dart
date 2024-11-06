import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

import '../../common/extensions/compact_map.dart';
import '../../common/extensions/date_time_ext.dart';
import '../../common/firestore_serializable_annotation.dart';
import '../../game/domain/game_detail_entity.dart';
import 'player_entity.dart';
import 'player_score.dart';

part 'play_entity.g.dart';

@Collection<PlayEntity>('plays')
final playsRef = PlayEntityCollectionReference();

@firestoreSerializable
class PlayEntity {
  @Id()
  final String id;

  final GameDetailEntity game;

  final DateTime playDate;
  final DateTime createdOn;
  final DateTime updatedOn;

  final String createdBy;

  final List<PlayerEntity> playerList;
  final List<PlayerScore> scoreList;

  // Used to read from db using array.contains
  final List<String> userIdList;

  PlayEntity({
    String? id,
    required this.game,
    required this.playerList,
    required this.createdBy,
    this.scoreList = const [],
    DateTime? playDate,
    DateTime? createdOn,
    DateTime? updatedOn,
    List<String>? userIdList,
  })  : id = id ?? const Uuid().v4(),
        playDate = playDate ?? DateTime.now().startOfDay,
        createdOn = createdOn ?? DateTime.now(),
        updatedOn = updatedOn ?? DateTime.now(),
        userIdList =
            userIdList ?? playerList.compactMap((e) => e.userId).toList();

  factory PlayEntity.fromJson(Map<String, dynamic> json) =>
      _$PlayEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlayEntityToJson(this);

  factory PlayEntity.stub() => PlayEntity(
        game: GameDetailEntity.stub(),
        playerList: List.generate(3, (_) => PlayerEntity.stub()),
        playDate: DateTime.now().startOfDay,
        createdOn: DateTime.now(),
        updatedOn: DateTime.now(),
        createdBy: 'userId',
      );

  PlayEntity copyWith({List<PlayerScore>? scoreList}) => PlayEntity(
        id: id,
        game: game,
        playDate: playDate,
        createdOn: createdOn,
        updatedOn: DateTime.now(),
        createdBy: createdBy,
        playerList: playerList,
        scoreList: scoreList ?? this.scoreList,
      );
}

extension PlayConvenience on PlayEntity {
  /// Returns a list of players sorted by their score, descending.
  /// If a player has no score, they are sorted to the bottom.
  List<PlayerEntity> get sortedPlayerList => playerList.sorted((a, b) {
        final aScore = scoreList.firstWhereOrNull((e) => e.playerId == a.id);
        final bScore = scoreList.firstWhereOrNull((e) => e.playerId == b.id);
        if (aScore == null && bScore == null) return 0;
        if (aScore == null) return 1;
        if (bScore == null) return -1;

        return bScore.totalScore.compareTo(aScore.totalScore);
      });

  Iterable<PlayerEntity> get winnerList {
    if (scoreList.isEmpty) return [];

    final winnerScore = scoreList.fold<int>(
      0,
      (result, e) => e.totalScore > result ? e.totalScore : result,
    );
    final winnerIdList = scoreList
        .where((e) => e.totalScore == winnerScore)
        .map((e) => e.playerId);
    return playerList.where((e) => winnerIdList.contains(e.id));
  }
}
