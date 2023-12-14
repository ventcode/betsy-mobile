import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

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


/// This will create a provider named `activityProvider` (like React global context)
/// which will cache the result of this function.
@riverpod
class AsyncCurrentUser extends _$AsyncCurrentUser {
  @override
  GoogleSignInAccount? build() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      state = account;
    });
    _googleSignIn.signInSilently();
    return null;
  }

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  void signOut() {
    state = null;
  }
}