import 'package:betsy_mobile/models/user.dart';
import 'package:betsy_mobile/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeScreen extends ConsumerStatefulWidget {
  const ChallengeScreen({super.key});

  @override
  ChallengeScreenState createState() => ChallengeScreenState();
}

class ChallengeScreenState extends ConsumerState<ChallengeScreen> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  User? selectedChallenger;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(usersProvider);

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

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
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
