import 'package:betsy_mobile/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengeStatus extends StatelessWidget {
  const ChallengeStatus({super.key, required this.challenge});

  final Challenge challenge;

  final Color _defaultColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: switch (challenge.status) {
          0 => Colors.grey,
          1 => Colors.green,
          2 => Colors.green,
          3 => Colors.amber,
          4 => Colors.red,
          _ => _defaultColor
        },
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
        child: Text(
            switch (challenge.status) {
              0 => "Pending",
              1 => "Accepted",
              2 => "Started",
              3 => "Finished",
              4 => "Chickened!",
              _ => challenge.status.toString()
            },
            style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
