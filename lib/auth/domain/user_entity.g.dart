// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

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
abstract class UserEntityCollectionReference
    implements
        UserEntityQuery,
        FirestoreCollectionReference<UserEntity, UserEntityQuerySnapshot> {
  factory UserEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserEntityCollectionReference;

  static UserEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserEntityFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserEntity value,
    SetOptions? options,
  ) {
    return _$UserEntityToJson(value);
  }

  @override
  CollectionReference<UserEntity> get reference;

  @override
  UserEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserEntityDocumentReference> add(UserEntity value);
}

class _$UserEntityCollectionReference extends _$UserEntityQuery
    implements UserEntityCollectionReference {
  factory _$UserEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserEntityCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserEntityCollectionReference.fromFirestore,
            toFirestore: UserEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$UserEntityCollectionReference._(
    CollectionReference<UserEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserEntity> get reference =>
      super.reference as CollectionReference<UserEntity>;

  @override
  UserEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserEntityDocumentReference> add(UserEntity value) {
    return reference.add(value).then((ref) => UserEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserEntityDocumentReference
    extends FirestoreDocumentReference<UserEntity, UserEntityDocumentSnapshot> {
  factory UserEntityDocumentReference(DocumentReference<UserEntity> reference) =
      _$UserEntityDocumentReference;

  DocumentReference<UserEntity> get reference;

  /// A reference to the [UserEntityCollectionReference] containing this document.
  UserEntityCollectionReference get parent {
    return _$UserEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<UserEntityDocumentSnapshot> snapshots();

  @override
  Future<UserEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String id,
    FieldValue idFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? displayName,
    FieldValue displayNameFieldValue,
    String? photoUrl,
    FieldValue photoUrlFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
    String? platform,
    FieldValue platformFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String id,
    FieldValue idFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? displayName,
    FieldValue displayNameFieldValue,
    String? photoUrl,
    FieldValue photoUrlFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
    String? platform,
    FieldValue platformFieldValue,
  });
}

class _$UserEntityDocumentReference
    extends FirestoreDocumentReference<UserEntity, UserEntityDocumentSnapshot>
    implements UserEntityDocumentReference {
  _$UserEntityDocumentReference(this.reference);

  @override
  final DocumentReference<UserEntity> reference;

  /// A reference to the [UserEntityCollectionReference] containing this document.
  UserEntityCollectionReference get parent {
    return _$UserEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<UserEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserEntityDocumentSnapshot._);
  }

  @override
  Future<UserEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserEntityDocumentSnapshot._);
  }

  @override
  Future<UserEntityDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserEntityDocumentSnapshot._);
  }

  Future<void> update({
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? photoUrl = _sentinel,
    FieldValue? photoUrlFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
    Object? platform = _sentinel,
    FieldValue? platformFieldValue,
  }) async {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      photoUrl == _sentinel || photoUrlFieldValue == null,
      "Cannot specify both photoUrl and photoUrlFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    assert(
      platform == _sentinel || platformFieldValue == null,
      "Cannot specify both platform and platformFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$UserEntityFieldMap['id']!:
            _$UserEntityPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserEntityFieldMap['id']!: idFieldValue,
      if (email != _sentinel)
        _$UserEntityFieldMap['email']!:
            _$UserEntityPerFieldToJson.email(email as String?),
      if (emailFieldValue != null)
        _$UserEntityFieldMap['email']!: emailFieldValue,
      if (displayName != _sentinel)
        _$UserEntityFieldMap['displayName']!:
            _$UserEntityPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$UserEntityFieldMap['displayName']!: displayNameFieldValue,
      if (photoUrl != _sentinel)
        _$UserEntityFieldMap['photoUrl']!:
            _$UserEntityPerFieldToJson.photoUrl(photoUrl as String?),
      if (photoUrlFieldValue != null)
        _$UserEntityFieldMap['photoUrl']!: photoUrlFieldValue,
      if (createdOn != _sentinel)
        _$UserEntityFieldMap['createdOn']!:
            _$UserEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$UserEntityFieldMap['createdOn']!: createdOnFieldValue,
      if (platform != _sentinel)
        _$UserEntityFieldMap['platform']!:
            _$UserEntityPerFieldToJson.platform(platform as String?),
      if (platformFieldValue != null)
        _$UserEntityFieldMap['platform']!: platformFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? photoUrl = _sentinel,
    FieldValue? photoUrlFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
    Object? platform = _sentinel,
    FieldValue? platformFieldValue,
  }) {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      photoUrl == _sentinel || photoUrlFieldValue == null,
      "Cannot specify both photoUrl and photoUrlFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    assert(
      platform == _sentinel || platformFieldValue == null,
      "Cannot specify both platform and platformFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$UserEntityFieldMap['id']!:
            _$UserEntityPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserEntityFieldMap['id']!: idFieldValue,
      if (email != _sentinel)
        _$UserEntityFieldMap['email']!:
            _$UserEntityPerFieldToJson.email(email as String?),
      if (emailFieldValue != null)
        _$UserEntityFieldMap['email']!: emailFieldValue,
      if (displayName != _sentinel)
        _$UserEntityFieldMap['displayName']!:
            _$UserEntityPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$UserEntityFieldMap['displayName']!: displayNameFieldValue,
      if (photoUrl != _sentinel)
        _$UserEntityFieldMap['photoUrl']!:
            _$UserEntityPerFieldToJson.photoUrl(photoUrl as String?),
      if (photoUrlFieldValue != null)
        _$UserEntityFieldMap['photoUrl']!: photoUrlFieldValue,
      if (createdOn != _sentinel)
        _$UserEntityFieldMap['createdOn']!:
            _$UserEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$UserEntityFieldMap['createdOn']!: createdOnFieldValue,
      if (platform != _sentinel)
        _$UserEntityFieldMap['platform']!:
            _$UserEntityPerFieldToJson.platform(platform as String?),
      if (platformFieldValue != null)
        _$UserEntityFieldMap['platform']!: platformFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserEntityQuery
    implements QueryReference<UserEntity, UserEntityQuerySnapshot> {
  @override
  UserEntityQuery limit(int limit);

  @override
  UserEntityQuery limitToLast(int limit);

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
  UserEntityQuery whereFieldPath(
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

  UserEntityQuery whereDocumentId({
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

  UserEntityQuery whereId({
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

  UserEntityQuery whereEmail({
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

  UserEntityQuery whereDisplayName({
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

  UserEntityQuery wherePhotoUrl({
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

  UserEntityQuery whereCreatedOn({
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

  UserEntityQuery wherePlatform({
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
  UserEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByDisplayName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByPhotoUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByCreatedOn({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByPlatform({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$UserEntityQuery
    extends QueryReference<UserEntity, UserEntityQuerySnapshot>
    implements UserEntityQuery {
  _$UserEntityQuery(
    this._collection, {
    required Query<UserEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(UserEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserEntityQuery limit(int limit) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery limitToLast(int limit) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery whereFieldPath(
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
    return _$UserEntityQuery(
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
  UserEntityQuery whereDocumentId({
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
    return _$UserEntityQuery(
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
  UserEntityQuery whereId({
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
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.id(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserEntityPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery whereEmail({
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
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['email']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.email(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.email(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.email(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.email(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.email(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .email(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserEntityPerFieldToJson.email(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery whereDisplayName({
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
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['displayName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.displayName(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.displayName(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.displayName(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .displayName(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.displayName(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .displayName(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.displayName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.displayName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery wherePhotoUrl({
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
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['photoUrl']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.photoUrl(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.photoUrl(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.photoUrl(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .photoUrl(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.photoUrl(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .photoUrl(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.photoUrl(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.photoUrl(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery whereCreatedOn({
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
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['createdOn']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.createdOn(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.createdOn(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.createdOn(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .createdOn(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.createdOn(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .createdOn(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.createdOn(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.createdOn(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery wherePlatform({
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
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['platform']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.platform(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserEntityPerFieldToJson.platform(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.platform(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .platform(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.platform(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson
                .platform(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.platform(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.platform(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserEntityFieldMap['id']!,
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['email']!, descending: descending);
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['displayName']!, descending: descending);
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderByPhotoUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['photoUrl']!, descending: descending);
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderByCreatedOn({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['createdOn']!, descending: descending);
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserEntityQuery orderByPlatform({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['platform']!, descending: descending);
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

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserEntityDocumentSnapshot extends FirestoreDocumentSnapshot<UserEntity> {
  UserEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserEntity> snapshot;

  @override
  UserEntityDocumentReference get reference {
    return UserEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserEntity? data;
}

class UserEntityQuerySnapshot extends FirestoreQuerySnapshot<UserEntity,
    UserEntityQueryDocumentSnapshot> {
  UserEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserEntity> snapshot,
  ) {
    final docs = snapshot.docs.map(UserEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserEntityDocumentSnapshot._,
      );
    }).toList();

    return UserEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserEntity> snapshot;

  @override
  final List<UserEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserEntityDocumentSnapshot>> docChanges;
}

class UserEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserEntity>
    implements UserEntityDocumentSnapshot {
  UserEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserEntity> snapshot;

  @override
  final UserEntity data;

  @override
  UserEntityDocumentReference get reference {
    return UserEntityDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as String,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      displayName: json['displayName'] as String?,
      createdOn: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdOn'], const FirestoreDateTimeConverter().fromJson),
      platform: json['platform'] as String?,
    );

const _$UserEntityFieldMap = <String, String>{
  'id': 'id',
  'email': 'email',
  'displayName': 'displayName',
  'photoUrl': 'photoUrl',
  'createdOn': 'createdOn',
  'platform': 'platform',
};

// ignore: unused_element
abstract class _$UserEntityPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? email(String? instance) => instance;
  // ignore: unused_element
  static Object? displayName(String? instance) => instance;
  // ignore: unused_element
  static Object? photoUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? createdOn(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? platform(String? instance) => instance;
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'createdOn':
          const FirestoreDateTimeConverter().toJson(instance.createdOn),
      'platform': instance.platform,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
