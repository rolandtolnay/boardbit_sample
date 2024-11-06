// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_entity.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PlayEntityCollectionReference
    implements
        PlayEntityQuery,
        FirestoreCollectionReference<PlayEntity, PlayEntityQuerySnapshot> {
  factory PlayEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PlayEntityCollectionReference;

  static PlayEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return PlayEntity.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    PlayEntity value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<PlayEntity> get reference;

  @override
  PlayEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PlayEntityDocumentReference> add(PlayEntity value);
}

class _$PlayEntityCollectionReference extends _$PlayEntityQuery
    implements PlayEntityCollectionReference {
  factory _$PlayEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PlayEntityCollectionReference._(
      firestore.collection('plays').withConverter(
            fromFirestore: PlayEntityCollectionReference.fromFirestore,
            toFirestore: PlayEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$PlayEntityCollectionReference._(
    CollectionReference<PlayEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<PlayEntity> get reference =>
      super.reference as CollectionReference<PlayEntity>;

  @override
  PlayEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PlayEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PlayEntityDocumentReference> add(PlayEntity value) {
    return reference.add(value).then((ref) => PlayEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlayEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PlayEntityDocumentReference
    extends FirestoreDocumentReference<PlayEntity, PlayEntityDocumentSnapshot> {
  factory PlayEntityDocumentReference(DocumentReference<PlayEntity> reference) =
      _$PlayEntityDocumentReference;

  DocumentReference<PlayEntity> get reference;

  /// A reference to the [PlayEntityCollectionReference] containing this document.
  PlayEntityCollectionReference get parent {
    return _$PlayEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<PlayEntityDocumentSnapshot> snapshots();

  @override
  Future<PlayEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    GameDetailEntity game,
    FieldValue gameFieldValue,
    DateTime playDate,
    FieldValue playDateFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
    DateTime updatedOn,
    FieldValue updatedOnFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    List<PlayerEntity> playerList,
    FieldValue playerListFieldValue,
    List<PlayerScore> scoreList,
    FieldValue scoreListFieldValue,
    List<String> userIdList,
    FieldValue userIdListFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    GameDetailEntity game,
    FieldValue gameFieldValue,
    DateTime playDate,
    FieldValue playDateFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
    DateTime updatedOn,
    FieldValue updatedOnFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    List<PlayerEntity> playerList,
    FieldValue playerListFieldValue,
    List<PlayerScore> scoreList,
    FieldValue scoreListFieldValue,
    List<String> userIdList,
    FieldValue userIdListFieldValue,
  });
}

class _$PlayEntityDocumentReference
    extends FirestoreDocumentReference<PlayEntity, PlayEntityDocumentSnapshot>
    implements PlayEntityDocumentReference {
  _$PlayEntityDocumentReference(this.reference);

  @override
  final DocumentReference<PlayEntity> reference;

  /// A reference to the [PlayEntityCollectionReference] containing this document.
  PlayEntityCollectionReference get parent {
    return _$PlayEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<PlayEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PlayEntityDocumentSnapshot._);
  }

  @override
  Future<PlayEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PlayEntityDocumentSnapshot._);
  }

  @override
  Future<PlayEntityDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PlayEntityDocumentSnapshot._);
  }

  Future<void> update({
    Object? game = _sentinel,
    FieldValue? gameFieldValue,
    Object? playDate = _sentinel,
    FieldValue? playDateFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
    Object? updatedOn = _sentinel,
    FieldValue? updatedOnFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? playerList = _sentinel,
    FieldValue? playerListFieldValue,
    Object? scoreList = _sentinel,
    FieldValue? scoreListFieldValue,
    Object? userIdList = _sentinel,
    FieldValue? userIdListFieldValue,
  }) async {
    assert(
      game == _sentinel || gameFieldValue == null,
      "Cannot specify both game and gameFieldValue",
    );
    assert(
      playDate == _sentinel || playDateFieldValue == null,
      "Cannot specify both playDate and playDateFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    assert(
      updatedOn == _sentinel || updatedOnFieldValue == null,
      "Cannot specify both updatedOn and updatedOnFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      playerList == _sentinel || playerListFieldValue == null,
      "Cannot specify both playerList and playerListFieldValue",
    );
    assert(
      scoreList == _sentinel || scoreListFieldValue == null,
      "Cannot specify both scoreList and scoreListFieldValue",
    );
    assert(
      userIdList == _sentinel || userIdListFieldValue == null,
      "Cannot specify both userIdList and userIdListFieldValue",
    );
    final json = {
      if (game != _sentinel)
        _$PlayEntityFieldMap['game']!:
            _$PlayEntityPerFieldToJson.game(game as GameDetailEntity),
      if (gameFieldValue != null) _$PlayEntityFieldMap['game']!: gameFieldValue,
      if (playDate != _sentinel)
        _$PlayEntityFieldMap['playDate']!:
            _$PlayEntityPerFieldToJson.playDate(playDate as DateTime),
      if (playDateFieldValue != null)
        _$PlayEntityFieldMap['playDate']!: playDateFieldValue,
      if (createdOn != _sentinel)
        _$PlayEntityFieldMap['createdOn']!:
            _$PlayEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$PlayEntityFieldMap['createdOn']!: createdOnFieldValue,
      if (updatedOn != _sentinel)
        _$PlayEntityFieldMap['updatedOn']!:
            _$PlayEntityPerFieldToJson.updatedOn(updatedOn as DateTime),
      if (updatedOnFieldValue != null)
        _$PlayEntityFieldMap['updatedOn']!: updatedOnFieldValue,
      if (createdBy != _sentinel)
        _$PlayEntityFieldMap['createdBy']!:
            _$PlayEntityPerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$PlayEntityFieldMap['createdBy']!: createdByFieldValue,
      if (playerList != _sentinel)
        _$PlayEntityFieldMap['playerList']!: _$PlayEntityPerFieldToJson
            .playerList(playerList as List<PlayerEntity>),
      if (playerListFieldValue != null)
        _$PlayEntityFieldMap['playerList']!: playerListFieldValue,
      if (scoreList != _sentinel)
        _$PlayEntityFieldMap['scoreList']!: _$PlayEntityPerFieldToJson
            .scoreList(scoreList as List<PlayerScore>),
      if (scoreListFieldValue != null)
        _$PlayEntityFieldMap['scoreList']!: scoreListFieldValue,
      if (userIdList != _sentinel)
        _$PlayEntityFieldMap['userIdList']!:
            _$PlayEntityPerFieldToJson.userIdList(userIdList as List<String>),
      if (userIdListFieldValue != null)
        _$PlayEntityFieldMap['userIdList']!: userIdListFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? game = _sentinel,
    FieldValue? gameFieldValue,
    Object? playDate = _sentinel,
    FieldValue? playDateFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
    Object? updatedOn = _sentinel,
    FieldValue? updatedOnFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? playerList = _sentinel,
    FieldValue? playerListFieldValue,
    Object? scoreList = _sentinel,
    FieldValue? scoreListFieldValue,
    Object? userIdList = _sentinel,
    FieldValue? userIdListFieldValue,
  }) {
    assert(
      game == _sentinel || gameFieldValue == null,
      "Cannot specify both game and gameFieldValue",
    );
    assert(
      playDate == _sentinel || playDateFieldValue == null,
      "Cannot specify both playDate and playDateFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    assert(
      updatedOn == _sentinel || updatedOnFieldValue == null,
      "Cannot specify both updatedOn and updatedOnFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      playerList == _sentinel || playerListFieldValue == null,
      "Cannot specify both playerList and playerListFieldValue",
    );
    assert(
      scoreList == _sentinel || scoreListFieldValue == null,
      "Cannot specify both scoreList and scoreListFieldValue",
    );
    assert(
      userIdList == _sentinel || userIdListFieldValue == null,
      "Cannot specify both userIdList and userIdListFieldValue",
    );
    final json = {
      if (game != _sentinel)
        _$PlayEntityFieldMap['game']!:
            _$PlayEntityPerFieldToJson.game(game as GameDetailEntity),
      if (gameFieldValue != null) _$PlayEntityFieldMap['game']!: gameFieldValue,
      if (playDate != _sentinel)
        _$PlayEntityFieldMap['playDate']!:
            _$PlayEntityPerFieldToJson.playDate(playDate as DateTime),
      if (playDateFieldValue != null)
        _$PlayEntityFieldMap['playDate']!: playDateFieldValue,
      if (createdOn != _sentinel)
        _$PlayEntityFieldMap['createdOn']!:
            _$PlayEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$PlayEntityFieldMap['createdOn']!: createdOnFieldValue,
      if (updatedOn != _sentinel)
        _$PlayEntityFieldMap['updatedOn']!:
            _$PlayEntityPerFieldToJson.updatedOn(updatedOn as DateTime),
      if (updatedOnFieldValue != null)
        _$PlayEntityFieldMap['updatedOn']!: updatedOnFieldValue,
      if (createdBy != _sentinel)
        _$PlayEntityFieldMap['createdBy']!:
            _$PlayEntityPerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$PlayEntityFieldMap['createdBy']!: createdByFieldValue,
      if (playerList != _sentinel)
        _$PlayEntityFieldMap['playerList']!: _$PlayEntityPerFieldToJson
            .playerList(playerList as List<PlayerEntity>),
      if (playerListFieldValue != null)
        _$PlayEntityFieldMap['playerList']!: playerListFieldValue,
      if (scoreList != _sentinel)
        _$PlayEntityFieldMap['scoreList']!: _$PlayEntityPerFieldToJson
            .scoreList(scoreList as List<PlayerScore>),
      if (scoreListFieldValue != null)
        _$PlayEntityFieldMap['scoreList']!: scoreListFieldValue,
      if (userIdList != _sentinel)
        _$PlayEntityFieldMap['userIdList']!:
            _$PlayEntityPerFieldToJson.userIdList(userIdList as List<String>),
      if (userIdListFieldValue != null)
        _$PlayEntityFieldMap['userIdList']!: userIdListFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PlayEntityQuery
    implements QueryReference<PlayEntity, PlayEntityQuerySnapshot> {
  @override
  PlayEntityQuery limit(int limit);

  @override
  PlayEntityQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  PlayEntityQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery whereGame({
    GameDetailEntity? isEqualTo,
    GameDetailEntity? isNotEqualTo,
    GameDetailEntity? isLessThan,
    GameDetailEntity? isLessThanOrEqualTo,
    GameDetailEntity? isGreaterThan,
    GameDetailEntity? isGreaterThanOrEqualTo,
    List<GameDetailEntity>? whereIn,
    List<GameDetailEntity>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery wherePlayDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery whereCreatedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery whereUpdatedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery whereCreatedBy({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  PlayEntityQuery wherePlayerList({
    List<PlayerEntity>? isEqualTo,
    List<PlayerEntity>? isNotEqualTo,
    List<PlayerEntity>? isLessThan,
    List<PlayerEntity>? isLessThanOrEqualTo,
    List<PlayerEntity>? isGreaterThan,
    List<PlayerEntity>? isGreaterThanOrEqualTo,
    PlayerEntity? arrayContains,
    List<PlayerEntity>? arrayContainsAny,
    bool? isNull,
  });

  PlayEntityQuery whereScoreList({
    List<PlayerScore>? isEqualTo,
    List<PlayerScore>? isNotEqualTo,
    List<PlayerScore>? isLessThan,
    List<PlayerScore>? isLessThanOrEqualTo,
    List<PlayerScore>? isGreaterThan,
    List<PlayerScore>? isGreaterThanOrEqualTo,
    PlayerScore? arrayContains,
    List<PlayerScore>? arrayContainsAny,
    bool? isNull,
  });

  PlayEntityQuery whereUserIdList({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  PlayEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByGame({
    bool descending = false,
    GameDetailEntity startAt,
    GameDetailEntity startAfter,
    GameDetailEntity endAt,
    GameDetailEntity endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByPlayDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByCreatedOn({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByUpdatedOn({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByCreatedBy({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByPlayerList({
    bool descending = false,
    List<PlayerEntity> startAt,
    List<PlayerEntity> startAfter,
    List<PlayerEntity> endAt,
    List<PlayerEntity> endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByScoreList({
    bool descending = false,
    List<PlayerScore> startAt,
    List<PlayerScore> startAfter,
    List<PlayerScore> endAt,
    List<PlayerScore> endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });

  PlayEntityQuery orderByUserIdList({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$PlayEntityQuery
    extends QueryReference<PlayEntity, PlayEntityQuerySnapshot>
    implements PlayEntityQuery {
  _$PlayEntityQuery(
    this._collection, {
    required Query<PlayEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PlayEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(PlayEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PlayEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(PlayEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PlayEntityQuery limit(int limit) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery limitToLast(int limit) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereGame({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<GameDetailEntity>? whereIn,
    List<GameDetailEntity>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['game']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.game(isEqualTo as GameDetailEntity)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.game(isNotEqualTo as GameDetailEntity)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson.game(isLessThan as GameDetailEntity)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .game(isLessThanOrEqualTo as GameDetailEntity)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson.game(isGreaterThan as GameDetailEntity)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .game(isGreaterThanOrEqualTo as GameDetailEntity)
            : null,
        whereIn: whereIn?.map((e) => _$PlayEntityPerFieldToJson.game(e)),
        whereNotIn: whereNotIn?.map((e) => _$PlayEntityPerFieldToJson.game(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery wherePlayDate({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['playDate']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.playDate(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.playDate(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson.playDate(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .playDate(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson.playDate(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .playDate(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$PlayEntityPerFieldToJson.playDate(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayEntityPerFieldToJson.playDate(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereCreatedOn({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['createdOn']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.createdOn(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.createdOn(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson.createdOn(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .createdOn(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson.createdOn(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .createdOn(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$PlayEntityPerFieldToJson.createdOn(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayEntityPerFieldToJson.createdOn(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereUpdatedOn({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['updatedOn']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.updatedOn(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.updatedOn(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson.updatedOn(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .updatedOn(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson.updatedOn(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .updatedOn(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$PlayEntityPerFieldToJson.updatedOn(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayEntityPerFieldToJson.updatedOn(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereCreatedBy({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['createdBy']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.createdBy(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.createdBy(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson.createdBy(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .createdBy(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson.createdBy(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .createdBy(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$PlayEntityPerFieldToJson.createdBy(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayEntityPerFieldToJson.createdBy(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery wherePlayerList({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<PlayerEntity>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['playerList']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson
                .playerList(isEqualTo as List<PlayerEntity>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson
                .playerList(isNotEqualTo as List<PlayerEntity>)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson
                .playerList(isLessThan as List<PlayerEntity>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .playerList(isLessThanOrEqualTo as List<PlayerEntity>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson
                .playerList(isGreaterThan as List<PlayerEntity>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .playerList(isGreaterThanOrEqualTo as List<PlayerEntity>)
            : null,
        arrayContains: arrayContains != null
            ? (_$PlayEntityPerFieldToJson
                    .playerList([arrayContains as PlayerEntity]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$PlayEntityPerFieldToJson.playerList(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereScoreList({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<PlayerScore>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['scoreList']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson
                .scoreList(isEqualTo as List<PlayerScore>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson
                .scoreList(isNotEqualTo as List<PlayerScore>)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson
                .scoreList(isLessThan as List<PlayerScore>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .scoreList(isLessThanOrEqualTo as List<PlayerScore>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson
                .scoreList(isGreaterThan as List<PlayerScore>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .scoreList(isGreaterThanOrEqualTo as List<PlayerScore>)
            : null,
        arrayContains: arrayContains != null
            ? (_$PlayEntityPerFieldToJson
                    .scoreList([arrayContains as PlayerScore]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$PlayEntityPerFieldToJson.scoreList(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery whereUserIdList({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayEntityFieldMap['userIdList']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson.userIdList(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayEntityPerFieldToJson
                .userIdList(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayEntityPerFieldToJson.userIdList(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .userIdList(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayEntityPerFieldToJson
                .userIdList(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayEntityPerFieldToJson
                .userIdList(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$PlayEntityPerFieldToJson.userIdList([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$PlayEntityPerFieldToJson.userIdList(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByGame({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PlayEntityFieldMap['game']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByPlayDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['playDate']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByCreatedOn({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['createdOn']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByUpdatedOn({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['updatedOn']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByCreatedBy({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['createdBy']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByPlayerList({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['playerList']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByScoreList({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['scoreList']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayEntityQuery orderByUserIdList({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayEntityDocumentSnapshot? startAtDocument,
    PlayEntityDocumentSnapshot? endAtDocument,
    PlayEntityDocumentSnapshot? endBeforeDocument,
    PlayEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayEntityFieldMap['userIdList']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PlayEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlayEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PlayEntityDocumentSnapshot extends FirestoreDocumentSnapshot<PlayEntity> {
  PlayEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<PlayEntity> snapshot;

  @override
  PlayEntityDocumentReference get reference {
    return PlayEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final PlayEntity? data;
}

class PlayEntityQuerySnapshot extends FirestoreQuerySnapshot<PlayEntity,
    PlayEntityQueryDocumentSnapshot> {
  PlayEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PlayEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<PlayEntity> snapshot,
  ) {
    final docs = snapshot.docs.map(PlayEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PlayEntityDocumentSnapshot._,
      );
    }).toList();

    return PlayEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PlayEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PlayEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PlayEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<PlayEntity> snapshot;

  @override
  final List<PlayEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PlayEntityDocumentSnapshot>> docChanges;
}

class PlayEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<PlayEntity>
    implements PlayEntityDocumentSnapshot {
  PlayEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<PlayEntity> snapshot;

  @override
  final PlayEntity data;

  @override
  PlayEntityDocumentReference get reference {
    return PlayEntityDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayEntity _$PlayEntityFromJson(Map<String, dynamic> json) => PlayEntity(
      id: json['id'] as String?,
      game: GameDetailEntity.fromJson(json['game'] as Map<String, dynamic>),
      playerList: (json['playerList'] as List<dynamic>)
          .map((e) => PlayerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['createdBy'] as String,
      scoreList: (json['scoreList'] as List<dynamic>?)
              ?.map((e) => PlayerScore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['playDate'], const FirestoreDateTimeConverter().fromJson),
      createdOn: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdOn'], const FirestoreDateTimeConverter().fromJson),
      updatedOn: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedOn'], const FirestoreDateTimeConverter().fromJson),
      userIdList: (json['userIdList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

const _$PlayEntityFieldMap = <String, String>{
  'id': 'id',
  'game': 'game',
  'playDate': 'playDate',
  'createdOn': 'createdOn',
  'updatedOn': 'updatedOn',
  'createdBy': 'createdBy',
  'playerList': 'playerList',
  'scoreList': 'scoreList',
  'userIdList': 'userIdList',
};

// ignore: unused_element
abstract class _$PlayEntityPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? game(GameDetailEntity instance) => instance.toJson();
  // ignore: unused_element
  static Object? playDate(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? createdOn(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? updatedOn(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? createdBy(String instance) => instance;
  // ignore: unused_element
  static Object? playerList(List<PlayerEntity> instance) =>
      instance.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? scoreList(List<PlayerScore> instance) =>
      instance.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? userIdList(List<String> instance) => instance;
}

Map<String, dynamic> _$PlayEntityToJson(PlayEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game': instance.game.toJson(),
      'playDate': const FirestoreDateTimeConverter().toJson(instance.playDate),
      'createdOn':
          const FirestoreDateTimeConverter().toJson(instance.createdOn),
      'updatedOn':
          const FirestoreDateTimeConverter().toJson(instance.updatedOn),
      'createdBy': instance.createdBy,
      'playerList': instance.playerList.map((e) => e.toJson()).toList(),
      'scoreList': instance.scoreList.map((e) => e.toJson()).toList(),
      'userIdList': instance.userIdList,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
