// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_game_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchGameHash() => r'056df3efff59d0509f2229dbbd6b82fc30f980d9';

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

abstract class _$SearchGame
    extends BuildlessAutoDisposeAsyncNotifier<List<SearchGameEntity>> {
  late final String query;

  FutureOr<List<SearchGameEntity>> build(
    String query,
  );
}

/// See also [SearchGame].
@ProviderFor(SearchGame)
const searchGameProvider = SearchGameFamily();

/// See also [SearchGame].
class SearchGameFamily extends Family<AsyncValue<List<SearchGameEntity>>> {
  /// See also [SearchGame].
  const SearchGameFamily();

  /// See also [SearchGame].
  SearchGameProvider call(
    String query,
  ) {
    return SearchGameProvider(
      query,
    );
  }

  @override
  SearchGameProvider getProviderOverride(
    covariant SearchGameProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchGameProvider';
}

/// See also [SearchGame].
class SearchGameProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchGame, List<SearchGameEntity>> {
  /// See also [SearchGame].
  SearchGameProvider(
    String query,
  ) : this._internal(
          () => SearchGame()..query = query,
          from: searchGameProvider,
          name: r'searchGameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchGameHash,
          dependencies: SearchGameFamily._dependencies,
          allTransitiveDependencies:
              SearchGameFamily._allTransitiveDependencies,
          query: query,
        );

  SearchGameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<SearchGameEntity>> runNotifierBuild(
    covariant SearchGame notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SearchGame Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchGameProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchGame, List<SearchGameEntity>>
      createElement() {
    return _SearchGameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchGameProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchGameRef
    on AutoDisposeAsyncNotifierProviderRef<List<SearchGameEntity>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchGameProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchGame,
        List<SearchGameEntity>> with SearchGameRef {
  _SearchGameProviderElement(super.provider);

  @override
  String get query => (origin as SearchGameProvider).query;
}

String _$searchGameQueryHash() => r'9ce635d97ec2bb636ffda1ba1efdb2d667c26e3a';

/// See also [SearchGameQuery].
@ProviderFor(SearchGameQuery)
final searchGameQueryProvider =
    AutoDisposeNotifierProvider<SearchGameQuery, String>.internal(
  SearchGameQuery.new,
  name: r'searchGameQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchGameQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchGameQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
