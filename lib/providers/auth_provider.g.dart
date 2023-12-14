// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncCurrentUserHash() => r'0b806cb1203c277a1e935d227bea5f7ab23adb38';

/// This will create a provider named `activityProvider` (like React global context)
/// which will cache the result of this function.
///
/// Copied from [AsyncCurrentUser].
@ProviderFor(AsyncCurrentUser)
final asyncCurrentUserProvider = AutoDisposeNotifierProvider<AsyncCurrentUser,
    GoogleSignInAccount?>.internal(
  AsyncCurrentUser.new,
  name: r'asyncCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncCurrentUser = AutoDisposeNotifier<GoogleSignInAccount?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
