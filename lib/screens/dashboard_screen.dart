import 'package:betsy_mobile/models/challange.dart';
import 'package:betsy_mobile/models/user.dart';
import 'package:flutter/material.dart';

final mockedListOfChallanges = [
  {
    "challanger": {
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
    "challanger": {
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
    "challanger": {
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
] as List<dynamic>;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final mockedList = mockedListOfChallanges
      .map((listElement) => Challange(
          challanger: User(
              name: listElement["challanger"]["name"],
              surname: listElement["challanger"]["surname"],
              profileImageUrl: listElement["challanger"]["profileImageUrl"]),
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
      ),
      body: Center(
        child: ListView.builder(
          itemCount: mockedList.length,
          itemBuilder: (context, index) {
            final challange = mockedList[index];

            return ListTile(
                title: Text(challange.challanger.name),
                subtitle: Text(challange.challanger.surname));
          },
        ),
      ),
    );
  }
}
