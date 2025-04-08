// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_generator_vm_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cellElementHash() => r'cfa8f98889400a114cdbf1ca1a996b1ef336de6d';

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

/// See also [cellElement].
@ProviderFor(cellElement)
const cellElementProvider = CellElementFamily();

/// See also [cellElement].
class CellElementFamily extends Family<GameElement?> {
  /// See also [cellElement].
  const CellElementFamily();

  /// See also [cellElement].
  CellElementProvider call(int index) {
    return CellElementProvider(index);
  }

  @override
  CellElementProvider getProviderOverride(
    covariant CellElementProvider provider,
  ) {
    return call(provider.index);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cellElementProvider';
}

/// See also [cellElement].
class CellElementProvider extends AutoDisposeProvider<GameElement?> {
  /// See also [cellElement].
  CellElementProvider(int index)
    : this._internal(
        (ref) => cellElement(ref as CellElementRef, index),
        from: cellElementProvider,
        name: r'cellElementProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$cellElementHash,
        dependencies: CellElementFamily._dependencies,
        allTransitiveDependencies: CellElementFamily._allTransitiveDependencies,
        index: index,
      );

  CellElementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(GameElement? Function(CellElementRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: CellElementProvider._internal(
        (ref) => create(ref as CellElementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<GameElement?> createElement() {
    return _CellElementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CellElementProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CellElementRef on AutoDisposeProviderRef<GameElement?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CellElementProviderElement
    extends AutoDisposeProviderElement<GameElement?>
    with CellElementRef {
  _CellElementProviderElement(super.provider);

  @override
  int get index => (origin as CellElementProvider).index;
}

String _$worldGeneratorViewModelHash() =>
    r'8533c8d1b5868e6ad78aa85b1cafd62f8492dd58';

/// See also [WorldGeneratorViewModel].
@ProviderFor(WorldGeneratorViewModel)
final worldGeneratorViewModelProvider = AutoDisposeNotifierProvider<
  WorldGeneratorViewModel,
  List<GameElement?>
>.internal(
  WorldGeneratorViewModel.new,
  name: r'worldGeneratorViewModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$worldGeneratorViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WorldGeneratorViewModel = AutoDisposeNotifier<List<GameElement?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
