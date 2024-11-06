// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_play_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singlePlayHash() => r'f7212d50b76b9d125da2385c0ad83f9cf06e062b';

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

abstract class _$SinglePlay
    extends BuildlessAutoDisposeAsyncNotifier<PlayEntity?> {
  late final String playId;

  FutureOr<PlayEntity?> build(
    String playId,
  );
}

/// See also [SinglePlay].
@ProviderFor(SinglePlay)
const singlePlayProvider = SinglePlayFamily();

/// See also [SinglePlay].
class SinglePlayFamily extends Family<AsyncValue<PlayEntity?>> {
  /// See also [SinglePlay].
  const SinglePlayFamily();

  /// See also [SinglePlay].
  SinglePlayProvider call(
    String playId,
  ) {
    return SinglePlayProvider(
      playId,
    );
  }

  @override
  SinglePlayProvider getProviderOverride(
    covariant SinglePlayProvider provider,
  ) {
    return call(
      provider.playId,
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
  String? get name => r'singlePlayProvider';
}

/// See also [SinglePlay].
class SinglePlayProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SinglePlay, PlayEntity?> {
  /// See also [SinglePlay].
  SinglePlayProvider(
    String playId,
  ) : this._internal(
          () => SinglePlay()..playId = playId,
          from: singlePlayProvider,
          name: r'singlePlayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singlePlayHash,
          dependencies: SinglePlayFamily._dependencies,
          allTransitiveDependencies:
              SinglePlayFamily._allTransitiveDependencies,
          playId: playId,
        );

  SinglePlayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playId,
  }) : super.internal();

  final String playId;

  @override
  FutureOr<PlayEntity?> runNotifierBuild(
    covariant SinglePlay notifier,
  ) {
    return notifier.build(
      playId,
    );
  }

  @override
  Override overrideWith(SinglePlay Function() create) {
    return ProviderOverride(
      origin: this,
      override: SinglePlayProvider._internal(
        () => create()..playId = playId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playId: playId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SinglePlay, PlayEntity?>
      createElement() {
    return _SinglePlayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SinglePlayProvider && other.playId == playId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SinglePlayRef on AutoDisposeAsyncNotifierProviderRef<PlayEntity?> {
  /// The parameter `playId` of this provider.
  String get playId;
}

class _SinglePlayProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SinglePlay, PlayEntity?>
    with SinglePlayRef {
  _SinglePlayProviderElement(super.provider);

  @override
  String get playId => (origin as SinglePlayProvider).playId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
