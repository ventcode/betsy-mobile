import 'package:betsy_mobile/models/new_challenge.dart';
import 'package:betsy_mobile/models/user.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:betsy_mobile/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/challenges_provider.dart';

class ChallengeScreen extends ConsumerStatefulWidget {
  const ChallengeScreen({super.key});

  @override
  ChallengeScreenState createState() => ChallengeScreenState();
}

class ChallengeScreenState extends ConsumerState<ChallengeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  User? selectedChallenger;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(usersProvider);
    final currentAPIUser = ref.watch(currentAPIUserProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Challenge"),
        ),
        body: switch (users) {
          AsyncData(:final value) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          DropdownButtonFormField<User>(
                            value: selectedChallenger,
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                selectedChallenger = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                selectedChallenger = value;
                              });
                            },
                            items: value.map((User challenger) {
                              return DropdownMenuItem<User>(
                                value: challenger,
                                child: Text(
                                  challenger.id.toString(),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Can't be empty";
                              }
                              return null;
                            },
                            controller: titleController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Challenge Subject',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Bet amount',
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            if (selectedChallenger?.id == null) return;
                            ref
                                .read(challengesNotifierProvider.notifier)
                                .addChallenge(NewChallenge(
                                    amount: int.parse(amountController.text),
                                    title: titleController.text,
                                    challengedId: selectedChallenger!.id,
                                    challengerId: currentAPIUser.value!.id));
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  )),
            ),
          AsyncError(:final error) => Text("$error"),
          AsyncLoading() => null,
          _ => null
        });
  }
}
