import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../common/firestore_serializable_annotation.dart';

part 'player_score.g.dart';

@firestoreSerializable
class PlayerScore extends Equatable {
  final String id;
  final String playerId;

  final List<int> scoreParts;

  PlayerScore({
    String? id,
    required this.playerId,
    required this.scoreParts,
  }) : id = id ?? const Uuid().v4();

  factory PlayerScore.fromJson(Map<String, dynamic> json) =>
      _$PlayerScoreFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerScoreToJson(this);

  PlayerScore copyWith({List<int>? scoreParts}) => PlayerScore(
        id: id,
        playerId: playerId,
        scoreParts: scoreParts ?? this.scoreParts,
      );

  PlayerScore addingScorePart(int scorePart) => PlayerScore(
        id: id,
        playerId: playerId,
        scoreParts: [...scoreParts, scorePart],
      );

  @override
  List<Object?> get props => [id];
}

extension PlayerScoreExt on PlayerScore {
  int get totalScore => scoreParts.fold(0, (result, e) => result + e);
}
