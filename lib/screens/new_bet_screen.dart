import 'package:betsy_mobile/models/challenge.dart';
import 'package:flutter/material.dart';

class NewBetScreen extends StatelessWidget {
  const NewBetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context)!.settings.arguments as Challenge;

    return Scaffold(
      appBar: AppBar(
        title: const Text("New fresh bet!"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_people))
        ],
      ),
      body: Hero(
        tag: "challenge${challenge.id}",
        child: Card(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
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
          ),
        )),
      ),
    );
  }
}
