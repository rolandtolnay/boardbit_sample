import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../auth/domain/user_entity.dart';
import '../../common/firestore_serializable_annotation.dart';

part 'player_entity.g.dart';

@Collection<PlayerEntity>('players')
final playersRef = PlayerEntityCollectionReference();

@firestoreSerializable
class PlayerEntity extends Equatable {
  @Id()
  final String id;
  final String name;

  final String? userId;
  final String? createdBy;

  final DateTime createdOn;

  PlayerEntity({
    String? id,
    required this.name,
    this.userId,
    this.createdBy,
    DateTime? createdOn,
  })  : id = id ?? const Uuid().v4(),
        createdOn = createdOn ?? DateTime.now();

  factory PlayerEntity.fromJson(Map<String, dynamic> json) =>
      _$PlayerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerEntityToJson(this);

  factory PlayerEntity.forUser(UserEntity user) {
    return PlayerEntity(
      name: user.displayName ?? '',
      userId: user.id,
      createdBy: user.id,
    );
  }

  factory PlayerEntity.stub() => PlayerEntity(
        id: '',
        name: 'Christian',
      );

  @override
  List<Object?> get props => [id];
}
