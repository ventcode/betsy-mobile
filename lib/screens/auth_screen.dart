import 'package:betsy_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'components/sign_in_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  Widget _buildBody(WidgetRef ref) {
    // The user is NOT Authenticated
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text('You are not currently signed in.'),
        // This method is used to separate mobile from web code with conditional exports.
        // See: src/sign_in_button.dart
        buildSignInButton(
          onPressed: () => ref.read(asyncCurrentUserProvider.notifier).signIn(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This screen has some logic associated with riverpod, it was done on purpose
    // just to demonstrate how it could be used, feel free to remove it.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("Auth"),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(ref),
        )
    );
  }
}
