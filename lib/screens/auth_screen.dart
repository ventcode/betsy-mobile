import 'package:betsy_mobile/providers/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/sign_in_button.dart';

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
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "Betsy",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 42),
                            Text(
                                "Log in to participate in challenges and place bets on your teammates!",
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                    buildSignInButton(
                      onPressed: () => currentUser.signIn(),
                    ),
                  ],
                )),
              );
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
