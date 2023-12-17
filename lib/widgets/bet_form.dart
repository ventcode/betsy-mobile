import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/models/new_bet.dart';
import 'package:betsy_mobile/providers/bet_provider.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:betsy_mobile/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BetForm extends ConsumerStatefulWidget {
  const BetForm({super.key, required this.challenge});

  final Challenge challenge;

  @override
  ConsumerState<BetForm> createState() => _BetFormState();
}

class _BetFormState extends ConsumerState<BetForm> {
  final _formKey = GlobalKey<FormState>();

  int _betValue = 50;
  bool _betOnChallenger = true;

  @override
  Widget build(BuildContext context) {
    final challenge = widget.challenge;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text("How much VBucks do you want to bet?")),
          Text(_betValue.toString()),
          Slider(
            value: _betValue.toDouble(),
            max: 100,
            divisions: 100,
            label: _betValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _betValue = value.toInt();
              });
            },
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text("On who do you place your bet?")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  child: UserAvatar(withBorder: _betOnChallenger),
                  onTap: () {
                    setState(() {
                      _betOnChallenger = true;
                    });
                  }),
              GestureDetector(
                  child: UserAvatar(withBorder: !_betOnChallenger),
                  onTap: () {
                    setState(() {
                      _betOnChallenger = false;
                    });
                  }),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ref.read(betNotifierProvider.notifier).createBet(NewBet(
                    userId: ref.read(currentAPIUserProvider).requireValue.id,
                    challengeId: challenge.id,
                    betOnChallenger: _betOnChallenger,
                    amount: _betValue));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text("Let's pray you won't lose those Vent\$...")),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ]),
      ),
    );
  }
}
