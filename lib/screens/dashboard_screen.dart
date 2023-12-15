import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/models/user.dart';
import 'package:flutter/material.dart';

final mockedListOfChallenges = [
  {
    "id": "1",
    "challenger": {
      "name": "Kuba",
      "surname": "Szopa",
      "profileImageUrl": "img"
    },
    "opponent": {
      "name": "Matausz",
      "surname": "Łata",
      "profileImageUrl": "img"
    },
    "date": "21-01-2024",
    "status": "pending"
  },
  {
    "id": "2",
    "challenger": {
      "name": "Kuba",
      "surname": "Szopa",
      "profileImageUrl": "img"
    },
    "opponent": {
      "name": "Matausz",
      "surname": "Łata",
      "profileImageUrl": "img"
    },
    "date": "21-01-2024",
    "status": "accepted"
  },
  {
    "id": "3",
    "challenger": {
      "name": "Kuba",
      "surname": "Szopa",
      "profileImageUrl": "img"
    },
    "opponent": {
      "name": "Matausz",
      "surname": "Łata",
      "profileImageUrl": "img"
    },
    "date": "21-01-2024",
    "status": "done"
  },
] as List<dynamic>;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final mockedList = mockedListOfChallenges
      .map((listElement) => Challenge(
          id: listElement["id"],
          challenger: User(
              name: listElement["challenger"]["name"],
              surname: listElement["challenger"]["surname"],
              profileImageUrl: listElement["challenger"]["profileImageUrl"]),
          opponent: User(
              name: listElement["opponent"]["name"],
              surname: listElement["opponent"]["surname"],
              profileImageUrl: listElement["opponent"]["profileImageUrl"]),
          date: listElement["date"],
          status: listElement["status"],
          value: listElement["status"],
          description: listElement["status"]))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_people))
        ],
        bottomOpacity: 0.5,
        elevation: 6.0,
        scrolledUnderElevation: 0.4,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Challenge!"),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/new-challenge");
        },
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: mockedList.length,
            itemBuilder: (context, index) {
              final challenge = mockedList[index];
              return GestureDetector(
                onTap: () {
                  switch (challenge.status) {
                    case "done":
                      Navigator.pushNamed(context, "/bet-details",
                          arguments: challenge);
                      break;
                    case "pending":
                      Navigator.pushNamed(context, "/challenge",
                          arguments: challenge);
                      break;
                    case "accepted":
                      Navigator.pushNamed(context, "/new-bet",
                          arguments: challenge);
                      break;
                  }
                },
                child: Hero(
                  tag: "challenge${challenge.id}",
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(challenge.challenger.name),
                              Text(challenge.challenger.surname),
                            ],
                          ),
                          Column(
                            children: [
                              Text(challenge.opponent.name),
                              Text(challenge.opponent.surname),
                            ],
                          ),
                          Text(challenge.status)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
