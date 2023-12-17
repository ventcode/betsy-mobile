import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/providers/challenges_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeProposal extends ConsumerWidget {
  const ChallengeProposal({super.key, required this.challenge});

  final Challenge challenge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        const Text(
          "You have been challenged!",
          style: TextStyle(fontSize: 22),
        ),
        const SizedBox(
          height: 24,
        ),
        FilledButton(
          onPressed: () {
            ref
                .read(challengesNotifierProvider.notifier)
                .acceptChallenge(challenge);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Accepted')),
            );
          },
          child: const Text('Accept the challenge'),
        ),
      ]),
    );
  }
}
