import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/foundation.dart';

import '../../common/firestore_serializable_annotation.dart';

part 'user_entity.g.dart';

@Collection<UserEntity>('users')
final usersRef = UserEntityCollectionReference();

@firestoreSerializable
class UserEntity {
  final String id;

  final String? email;
  final String? displayName;
  final String? photoUrl;

  final DateTime createdOn;
  final String? platform;

  UserEntity({
    required this.id,
    required this.email,
    this.photoUrl,
    this.displayName,
    DateTime? createdOn,
    String? platform,
  })  : platform = platform ?? defaultTargetPlatform.toString(),
        createdOn = createdOn ?? DateTime.now();

  UserEntity copyWith({
    bool? isOnboarded,
    String? displayName,
  }) =>
      UserEntity(
        id: id,
        email: email,
        photoUrl: photoUrl,
        displayName: displayName ?? this.displayName,
        createdOn: createdOn,
        platform: platform,
      );

  @override
  String toString() => 'UserEntity(id: $id)';
}
