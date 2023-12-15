import 'package:betsy_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'components/sign_in_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.read(asyncCurrentUserProvider.notifier);
    final futureUser = ref.watch(asyncCurrentUserProvider);

    futureUser.whenData((data) {
      if (data != null) {
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, '/dashboard');
        });
      }
    });

    return Scaffold(
      body: futureUser.when(
          data: (user) {
            if (user != null) {
              return Container();
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text('You are not currently signed in.'),
                  // This method is used to separate mobile from web code with conditional exports.
                  // See: src/sign_in_button.dart
                  buildSignInButton(
                    onPressed: () => currentUser.signIn(),
                  ),
                ],
              ));
            }
          },
          error: (_, _1) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text('You are not currently signed in.'),
                  // This method is used to separate mobile from web code with conditional exports.
                  // See: src/sign_in_button.dart
                  buildSignInButton(
                    onPressed: () => currentUser.signIn(),
                  ),
                ],
              ),
          loading: () => const Text('loading')),
    );
  }
}
