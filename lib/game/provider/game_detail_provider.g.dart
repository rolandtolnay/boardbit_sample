// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameDetailHash() => r'25af247bde5331a886afc09d4b1c9c4f8f9b5a6e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GameDetail extends BuildlessAsyncNotifier<GameDetailEntity?> {
  late final String bggId;

  FutureOr<GameDetailEntity?> build(
    String bggId,
  );
}

/// See also [GameDetail].
@ProviderFor(GameDetail)
const gameDetailProvider = GameDetailFamily();

/// See also [GameDetail].
class GameDetailFamily extends Family<AsyncValue<GameDetailEntity?>> {
  /// See also [GameDetail].
  const GameDetailFamily();

  /// See also [GameDetail].
  GameDetailProvider call(
    String bggId,
  ) {
    return GameDetailProvider(
      bggId,
    );
  }

  @override
  GameDetailProvider getProviderOverride(
    covariant GameDetailProvider provider,
  ) {
    return call(
      provider.bggId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gameDetailProvider';
}

/// See also [GameDetail].
class GameDetailProvider
    extends AsyncNotifierProviderImpl<GameDetail, GameDetailEntity?> {
  /// See also [GameDetail].
  GameDetailProvider(
    String bggId,
  ) : this._internal(
          () => GameDetail()..bggId = bggId,
          from: gameDetailProvider,
          name: r'gameDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameDetailHash,
          dependencies: GameDetailFamily._dependencies,
          allTransitiveDependencies:
              GameDetailFamily._allTransitiveDependencies,
          bggId: bggId,
        );

  GameDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bggId,
  }) : super.internal();

  final String bggId;

  @override
  FutureOr<GameDetailEntity?> runNotifierBuild(
    covariant GameDetail notifier,
  ) {
    return notifier.build(
      bggId,
    );
  }

  @override
  Override overrideWith(GameDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameDetailProvider._internal(
        () => create()..bggId = bggId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bggId: bggId,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<GameDetail, GameDetailEntity?> createElement() {
    return _GameDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDetailProvider && other.bggId == bggId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bggId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameDetailRef on AsyncNotifierProviderRef<GameDetailEntity?> {
  /// The parameter `bggId` of this provider.
  String get bggId;
}

class _GameDetailProviderElement
    extends AsyncNotifierProviderElement<GameDetail, GameDetailEntity?>
    with GameDetailRef {
  _GameDetailProviderElement(super.provider);

  @override
  String get bggId => (origin as GameDetailProvider).bggId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
