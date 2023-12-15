import 'package:betsy_mobile/models/challenge.dart';
import 'package:flutter/material.dart';

class NewBetScreen extends StatefulWidget {
  const NewBetScreen({super.key});

  @override
  State<NewBetScreen> createState() => _NewBetScreenState();
}

class _NewBetScreenState extends State<NewBetScreen> {
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("How much VBucks do you want to bet?")),
                FormField(
                  builder: (FormFieldState<double> field) {
                    var fieldValue = field.value ?? 10;
                    return Slider(
                      value: fieldValue,
                      max: 100,
                      divisions: 100,
                      label: fieldValue.round().toString(),
                      onChanged: (double value) {
                        field.didChange(value);
                      },
                    );
                  },
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("On who do you place your bet?")),
                FormField(
                  builder: (FormFieldState<int> field) {
                    return Row(
                      children: [
                        GestureDetector(
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  side: field.value == challenge.challenger.id
                                      ? BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 5)
                                      : BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  "https://lh3.googleusercontent.com/a/ACg8ocKCpMj3IEKixvQeFm9mbioqATHN1koi6xkw75Fm7lXAYw=s96-c",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ]),
                            onTap: () {
                              field.didChange(challenge.challenger.id);
                            }),
                        GestureDetector(
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  side: field.value == challenge.opponent.id
                                      ? BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 5)
                                      : BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  "https://lh3.googleusercontent.com/a/ACg8ocKCpMj3IEKixvQeFm9mbioqATHN1koi6xkw75Fm7lXAYw=s96-c",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ]),
                            onTap: () {
                              field.didChange(challenge.opponent.id);
                            }),
                      ],
                    );
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sending your money')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ]),
            ),
          )
        ]),
      )),
    );
  }
}
