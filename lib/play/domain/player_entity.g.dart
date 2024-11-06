// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_entity.dart';

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
abstract class PlayerEntityCollectionReference
    implements
        PlayerEntityQuery,
        FirestoreCollectionReference<PlayerEntity, PlayerEntityQuerySnapshot> {
  factory PlayerEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PlayerEntityCollectionReference;

  static PlayerEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return PlayerEntity.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    PlayerEntity value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<PlayerEntity> get reference;

  @override
  PlayerEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PlayerEntityDocumentReference> add(PlayerEntity value);
}

class _$PlayerEntityCollectionReference extends _$PlayerEntityQuery
    implements PlayerEntityCollectionReference {
  factory _$PlayerEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PlayerEntityCollectionReference._(
      firestore.collection('players').withConverter(
            fromFirestore: PlayerEntityCollectionReference.fromFirestore,
            toFirestore: PlayerEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$PlayerEntityCollectionReference._(
    CollectionReference<PlayerEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<PlayerEntity> get reference =>
      super.reference as CollectionReference<PlayerEntity>;

  @override
  PlayerEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PlayerEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PlayerEntityDocumentReference> add(PlayerEntity value) {
    return reference
        .add(value)
        .then((ref) => PlayerEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlayerEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PlayerEntityDocumentReference extends FirestoreDocumentReference<
    PlayerEntity, PlayerEntityDocumentSnapshot> {
  factory PlayerEntityDocumentReference(
          DocumentReference<PlayerEntity> reference) =
      _$PlayerEntityDocumentReference;

  DocumentReference<PlayerEntity> get reference;

  /// A reference to the [PlayerEntityCollectionReference] containing this document.
  PlayerEntityCollectionReference get parent {
    return _$PlayerEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<PlayerEntityDocumentSnapshot> snapshots();

  @override
  Future<PlayerEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
    String? createdBy,
    FieldValue createdByFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
    String? createdBy,
    FieldValue createdByFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
  });
}

class _$PlayerEntityDocumentReference extends FirestoreDocumentReference<
    PlayerEntity,
    PlayerEntityDocumentSnapshot> implements PlayerEntityDocumentReference {
  _$PlayerEntityDocumentReference(this.reference);

  @override
  final DocumentReference<PlayerEntity> reference;

  /// A reference to the [PlayerEntityCollectionReference] containing this document.
  PlayerEntityCollectionReference get parent {
    return _$PlayerEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<PlayerEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PlayerEntityDocumentSnapshot._);
  }

  @override
  Future<PlayerEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PlayerEntityDocumentSnapshot._);
  }

  @override
  Future<PlayerEntityDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PlayerEntityDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$PlayerEntityFieldMap['name']!:
            _$PlayerEntityPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$PlayerEntityFieldMap['name']!: nameFieldValue,
      if (userId != _sentinel)
        _$PlayerEntityFieldMap['userId']!:
            _$PlayerEntityPerFieldToJson.userId(userId as String?),
      if (userIdFieldValue != null)
        _$PlayerEntityFieldMap['userId']!: userIdFieldValue,
      if (createdBy != _sentinel)
        _$PlayerEntityFieldMap['createdBy']!:
            _$PlayerEntityPerFieldToJson.createdBy(createdBy as String?),
      if (createdByFieldValue != null)
        _$PlayerEntityFieldMap['createdBy']!: createdByFieldValue,
      if (createdOn != _sentinel)
        _$PlayerEntityFieldMap['createdOn']!:
            _$PlayerEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$PlayerEntityFieldMap['createdOn']!: createdOnFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$PlayerEntityFieldMap['name']!:
            _$PlayerEntityPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$PlayerEntityFieldMap['name']!: nameFieldValue,
      if (userId != _sentinel)
        _$PlayerEntityFieldMap['userId']!:
            _$PlayerEntityPerFieldToJson.userId(userId as String?),
      if (userIdFieldValue != null)
        _$PlayerEntityFieldMap['userId']!: userIdFieldValue,
      if (createdBy != _sentinel)
        _$PlayerEntityFieldMap['createdBy']!:
            _$PlayerEntityPerFieldToJson.createdBy(createdBy as String?),
      if (createdByFieldValue != null)
        _$PlayerEntityFieldMap['createdBy']!: createdByFieldValue,
      if (createdOn != _sentinel)
        _$PlayerEntityFieldMap['createdOn']!:
            _$PlayerEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$PlayerEntityFieldMap['createdOn']!: createdOnFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PlayerEntityQuery
    implements QueryReference<PlayerEntity, PlayerEntityQuerySnapshot> {
  @override
  PlayerEntityQuery limit(int limit);

  @override
  PlayerEntityQuery limitToLast(int limit);

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
  PlayerEntityQuery whereFieldPath(
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

  PlayerEntityQuery whereDocumentId({
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

  PlayerEntityQuery whereName({
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

  PlayerEntityQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  PlayerEntityQuery whereCreatedBy({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  PlayerEntityQuery whereCreatedOn({
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
  PlayerEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  });

  PlayerEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  });

  PlayerEntityQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  });

  PlayerEntityQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  });

  PlayerEntityQuery orderByCreatedBy({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  });

  PlayerEntityQuery orderByCreatedOn({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$PlayerEntityQuery
    extends QueryReference<PlayerEntity, PlayerEntityQuerySnapshot>
    implements PlayerEntityQuery {
  _$PlayerEntityQuery(
    this._collection, {
    required Query<PlayerEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PlayerEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(PlayerEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PlayerEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(PlayerEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PlayerEntityQuery limit(int limit) {
    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayerEntityQuery limitToLast(int limit) {
    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayerEntityQuery whereFieldPath(
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
    return _$PlayerEntityQuery(
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
  PlayerEntityQuery whereDocumentId({
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
    return _$PlayerEntityQuery(
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
  PlayerEntityQuery whereName({
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
    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayerEntityFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayerEntityPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayerEntityPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$PlayerEntityPerFieldToJson.name(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayerEntityPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayerEntityQuery whereUserId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayerEntityFieldMap['userId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.userId(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.userId(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayerEntityPerFieldToJson.userId(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .userId(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayerEntityPerFieldToJson.userId(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .userId(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$PlayerEntityPerFieldToJson.userId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayerEntityPerFieldToJson.userId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayerEntityQuery whereCreatedBy({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayerEntityFieldMap['createdBy']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.createdBy(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.createdBy(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayerEntityPerFieldToJson.createdBy(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .createdBy(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayerEntityPerFieldToJson.createdBy(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .createdBy(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$PlayerEntityPerFieldToJson.createdBy(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayerEntityPerFieldToJson.createdBy(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayerEntityQuery whereCreatedOn({
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
    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlayerEntityFieldMap['createdOn']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.createdOn(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$PlayerEntityPerFieldToJson.createdOn(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$PlayerEntityPerFieldToJson.createdOn(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .createdOn(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$PlayerEntityPerFieldToJson.createdOn(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$PlayerEntityPerFieldToJson
                .createdOn(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$PlayerEntityPerFieldToJson.createdOn(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$PlayerEntityPerFieldToJson.createdOn(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlayerEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
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

    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayerEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
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

    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayerEntityQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayerEntityFieldMap['name']!, descending: descending);
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

    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayerEntityQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayerEntityFieldMap['userId']!, descending: descending);
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

    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayerEntityQuery orderByCreatedBy({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayerEntityFieldMap['createdBy']!, descending: descending);
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

    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  PlayerEntityQuery orderByCreatedOn({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerEntityDocumentSnapshot? startAtDocument,
    PlayerEntityDocumentSnapshot? endAtDocument,
    PlayerEntityDocumentSnapshot? endBeforeDocument,
    PlayerEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlayerEntityFieldMap['createdOn']!, descending: descending);
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

    return _$PlayerEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlayerEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PlayerEntityDocumentSnapshot
    extends FirestoreDocumentSnapshot<PlayerEntity> {
  PlayerEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<PlayerEntity> snapshot;

  @override
  PlayerEntityDocumentReference get reference {
    return PlayerEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final PlayerEntity? data;
}

class PlayerEntityQuerySnapshot extends FirestoreQuerySnapshot<PlayerEntity,
    PlayerEntityQueryDocumentSnapshot> {
  PlayerEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PlayerEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<PlayerEntity> snapshot,
  ) {
    final docs =
        snapshot.docs.map(PlayerEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PlayerEntityDocumentSnapshot._,
      );
    }).toList();

    return PlayerEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PlayerEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PlayerEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PlayerEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<PlayerEntity> snapshot;

  @override
  final List<PlayerEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PlayerEntityDocumentSnapshot>> docChanges;
}

class PlayerEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<PlayerEntity>
    implements PlayerEntityDocumentSnapshot {
  PlayerEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<PlayerEntity> snapshot;

  @override
  final PlayerEntity data;

  @override
  PlayerEntityDocumentReference get reference {
    return PlayerEntityDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerEntity _$PlayerEntityFromJson(Map<String, dynamic> json) => PlayerEntity(
      id: json['id'] as String?,
      name: json['name'] as String,
      userId: json['userId'] as String?,
      createdBy: json['createdBy'] as String?,
      createdOn: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdOn'], const FirestoreDateTimeConverter().fromJson),
    );

const _$PlayerEntityFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'userId': 'userId',
  'createdBy': 'createdBy',
  'createdOn': 'createdOn',
};

// ignore: unused_element
abstract class _$PlayerEntityPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? userId(String? instance) => instance;
  // ignore: unused_element
  static Object? createdBy(String? instance) => instance;
  // ignore: unused_element
  static Object? createdOn(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
}

Map<String, dynamic> _$PlayerEntityToJson(PlayerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'createdBy': instance.createdBy,
      'createdOn':
          const FirestoreDateTimeConverter().toJson(instance.createdOn),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
