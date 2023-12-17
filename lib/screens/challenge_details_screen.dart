import 'package:betsy_mobile/providers/challenge_provider.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:betsy_mobile/providers/current_user_bets_provider.dart';
import 'package:betsy_mobile/widgets/bet_form.dart';
import 'package:betsy_mobile/widgets/challenge_bet.dart';
import 'package:betsy_mobile/widgets/challenge_proposal.dart';
import 'package:betsy_mobile/widgets/challenge_status.dart';
import 'package:betsy_mobile/widgets/user_small.dart';
import 'package:collection/collection.dart';
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

    // TODO: refactor, shit
    if (challenge.isLoading) return const SizedBox.shrink();

    final currentUserBets = ref.watch(currentUserBetsProvider);
    final currentAPIUser = ref.watch(currentAPIUserProvider);
    final currentUserChallengeBet =
        currentUserBets.requireValue.firstWhereOrNull(
      (bet) => bet.challengeId == challenge.requireValue.id,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Bet details"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_people))
          ],
        ),
        body: switch (challenge) {
          AsyncData(:final value) => Card(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LimitedBox(
                        maxWidth: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserSmall(user: value.challenger),
                            const Text(
                              "Challenger",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        )),
                    Column(
                      children: [
                        const Text("VS"),
                        ChallengeStatus(challenge: value),
                      ],
                    ),
                    LimitedBox(
                      maxWidth: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserSmall(user: value.opponent),
                          const Text(
                            "Opponent",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                currentUserChallengeBet != null
                    ? ChallengeBet(
                        bet: currentUserChallengeBet,
                        challenge: value,
                      )
                    : const SizedBox.shrink(),
                currentAPIUser.requireValue.canBetOn(value) &&
                        currentUserChallengeBet == null
                    ? BetForm(challenge: value)
                    : const SizedBox.shrink(),
                currentAPIUser.requireValue.canAccept(value)
                    ? ChallengeProposal(challenge: value)
                    : const SizedBox.shrink(),
              ]),
            )),
          // TODO: Handle this case.
          AsyncError(:final error) => Text('no wyjebao sie, $error'),
          AsyncLoading() =>
            const CircularProgressIndicator(color: Colors.amber),
          _ => null
        });
  }
}
