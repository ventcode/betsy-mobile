// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncCurrentUserHash() => r'd3bfe35c21040bbe31653845c34d3fe96c490ab3';

/// This will create a provider named `authProvider` (like React global context)
/// which will cache the result of this function.
///
/// Copied from [AsyncCurrentUser].
@ProviderFor(AsyncCurrentUser)
final asyncCurrentUserProvider = AutoDisposeAsyncNotifierProvider<
    AsyncCurrentUser, GoogleSignInAccount?>.internal(
  AsyncCurrentUser.new,
  name: r'asyncCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncCurrentUser = AutoDisposeAsyncNotifier<GoogleSignInAccount?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
