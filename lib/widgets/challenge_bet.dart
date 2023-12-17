import 'package:betsy_mobile/models/bet.dart';
import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class ChallengeBet extends StatelessWidget {
  const ChallengeBet({super.key, required this.bet, required this.challenge});

  final Bet bet;
  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text("You bet ${bet.amount} Vent\$ on:",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ),
            const UserAvatar(),
            Text(
              "(${bet.betOnChallenger ? challenge.challenger.id.toString() : challenge.opponent.id.toString()})",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )
          ],
        ),
      ),
    );
  }
}
