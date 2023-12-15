import 'package:betsy_mobile/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengeProposalScreen extends StatefulWidget {
  const ChallengeProposalScreen({super.key});

  @override
  State<ChallengeProposalScreen> createState() =>
      _ChallengeProposalScreenState();
}

class _ChallengeProposalScreenState extends State<ChallengeProposalScreen> {
  final _formKey = GlobalKey<FormState>();

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
      body: Card(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Text(
            "You have been challenged!",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 30,
          ),
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
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Accepted')),
              );
            },
            child: const Text('Accept the challenge'),
          ),
        ]),
      )),
    );
  }
}
