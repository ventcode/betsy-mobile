import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class Person {
  final String name;
  final String value;

  Person({required this.name, required this.value});
}

List<Person> challengers = [
  Person(name: 'Mateo Łata', value: 'mateoL'),
  Person(name: 'Mateo Szklanko', value: 'mateoSz'),
  Person(name: 'Vladimir Putin', value: 'vladimir'),
];

class _ChallengeScreenState extends State<ChallengeScreen> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  Person? selectedChallenger;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DropdownButtonFormField<Person>(
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
                      validator: (Person? challenger) {
                        if (challenger!.value.isEmpty) {
                          return "can't be empty";
                        } else {
                          return null;
                        }
                      },
                      items: challengers.map((Person challenger) {
                        return DropdownMenuItem<Person>(
                          value: challenger,
                          child: Text(
                            challenger.name,
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
    );
  }
}
