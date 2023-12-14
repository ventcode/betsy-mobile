import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:betsy_mobile/models/auth_model.dart';
import 'package:betsy_mobile/providers/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This screen has some logic associated with riverpod, it was done on purpose
    // just to demonstrate how it could be used, feel free to remove it.
    return Consumer(builder: (context, ref, child) {
      final AsyncValue<Auth> auth = ref.watch(authProvider);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Auth"),
        ),
        body: Center(
          child: switch (auth) {
            AsyncData(:final value) => Text('Activity: ${value.activity}'),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const CircularProgressIndicator(),
          },
        ),
      );
    });
  }
}
