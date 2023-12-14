import 'package:betsy_mobile/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context)!.settings.arguments as Challenge;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "You Have Been Challanged! (or you challanged someone, its the same screen)"),
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
