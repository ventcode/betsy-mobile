import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Necessary for code-generation to work
part 'current_user_provider.g.dart';

const List<String> scopes = <String>[
  'email',
  'profile',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

@riverpod
class AsyncCurrentUser extends _$AsyncCurrentUser {
  @override
  FutureOr<GoogleSignInAccount?> build() async {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      state = AsyncValue.data(account);
    });

    await _googleSignIn.signInSilently();
    return null;
  }

  Future<void> signIn() async {
    await AsyncValue.guard(() async {
      await _googleSignIn.signIn();

      _googleSignIn.signInSilently();
      return;
    });
  }

  // TODO: check if this can be done without context
  void signOut(context) async {
    await AsyncValue.guard(() async {
      await _googleSignIn.signOut();
      state = const AsyncValue.data(null);
      Navigator.pushReplacementNamed(context, '/auth');
    });
  }
}
