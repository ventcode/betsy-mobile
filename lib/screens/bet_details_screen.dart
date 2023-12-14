import 'package:betsy_mobile/models/challenge.dart';
import 'package:flutter/material.dart';

class BetDetailsScreen extends StatelessWidget {
  const BetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context)!.settings.arguments as Challenge;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bet details"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_people))
        ],
      ),
      body: Hero(
        tag: "challenge${challenge.id}",
        child: Card(
            child: Row(
          children: [
            Column(
              children: [
                Text(challenge.challenger.name),
                Text(challenge.challenger.surname),
              ],
            ),
            Column(
              children: [
                Text(challenge.opponent.name),
                Text(challenge.opponent.surname),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
