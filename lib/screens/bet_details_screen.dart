import 'package:betsy_mobile/providers/challenge_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BetDetailsScreenArguments {
  int id;

  BetDetailsScreenArguments(this.id);
}

class BetDetailsScreen extends ConsumerWidget {
  const BetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as BetDetailsScreenArguments;
    final challenge = ref.watch(challengeProvider(arguments.id));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Bet details"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_people))
          ],
        ),
        body: switch (challenge) {
          AsyncData(:final value) => Hero(
              tag: "challenge${value.id}",
              child: Card(
                  child: Row(
                children: [
                  Column(
                    children: [
                      Text(value.challenger.id.toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text(value.opponent.id.toString()),
                    ],
                  ),
                ],
              )),
            ),
          // TODO: Handle this case.
          AsyncError(:final error) => Text('no wyjebao sie, $error'),
          AsyncLoading() =>
            const CircularProgressIndicator(color: Colors.amber),
          _ => null
        });
  }
}
