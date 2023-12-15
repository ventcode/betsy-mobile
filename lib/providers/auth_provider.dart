import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// Necessary for code-generation to work
part 'auth_provider.g.dart';

const List<String> scopes = <String>[
  'email',
  'profile',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

/// This will create a provider named `authProvider` (like React global context)
/// which will cache the result of this function.
@riverpod
class AsyncCurrentUser extends _$AsyncCurrentUser {
  @override
  FutureOr<GoogleSignInAccount?> build() async {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      state = AsyncValue.data(account);
      final authCode = await account?.authentication;

      await http.get(Uri.parse('http://10.0.2.2:8080/user'), headers: {
        HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
      });
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

  void signOut() async {
    await AsyncValue.guard(() async {
      await _googleSignIn.signOut();
      state = const AsyncValue.data(null);
    });
  }
}
