// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeHash() => r'dd3c859154aa6d756b542433dddbee2588e64867';

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

/// See also [challenge].
@ProviderFor(challenge)
const challengeProvider = ChallengeFamily();

/// See also [challenge].
class ChallengeFamily extends Family<AsyncValue<Challenge>> {
  /// See also [challenge].
  const ChallengeFamily();

  /// See also [challenge].
  ChallengeProvider call(
    int id,
  ) {
    return ChallengeProvider(
      id,
    );
  }

  @override
  ChallengeProvider getProviderOverride(
    covariant ChallengeProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'challengeProvider';
}

/// See also [challenge].
class ChallengeProvider extends AutoDisposeFutureProvider<Challenge> {
  /// See also [challenge].
  ChallengeProvider(
    int id,
  ) : this._internal(
          (ref) => challenge(
            ref as ChallengeRef,
            id,
          ),
          from: challengeProvider,
          name: r'challengeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeHash,
          dependencies: ChallengeFamily._dependencies,
          allTransitiveDependencies: ChallengeFamily._allTransitiveDependencies,
          id: id,
        );

  ChallengeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Challenge> Function(ChallengeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChallengeProvider._internal(
        (ref) => create(ref as ChallengeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Challenge> createElement() {
    return _ChallengeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChallengeRef on AutoDisposeFutureProviderRef<Challenge> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ChallengeProviderElement
    extends AutoDisposeFutureProviderElement<Challenge> with ChallengeRef {
  _ChallengeProviderElement(super.provider);

  @override
  int get id => (origin as ChallengeProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
