import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/widgets/user_small.dart';
import 'package:flutter/material.dart';

import 'challenge_status.dart';

class ChallengeTile extends StatelessWidget {
  const ChallengeTile({super.key, required this.challenge});

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black26))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: UserSmall(user: challenge.challenger),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Challenger",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [ChallengeStatus(challenge: challenge)],
                      ),
                    ),
                    const SizedBox(height: 20),
                    IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // const Icon(
                          //   Icons.attach_money_rounded,
                          //   color: Colors.black,
                          // ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(challenge.amount.toString()),
                                const Text("Value"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: UserSmall(user: challenge.opponent),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Opponent",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
