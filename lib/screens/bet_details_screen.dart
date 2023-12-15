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
      body: Card(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(challenge.challenger.id.toString()),
                  const Text(
                    "challenger",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const Text("VS"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(challenge.opponent.id.toString()),
                  const Text("opponent", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
        ]),
      )),
    );
  }
}
