import 'package:betsy_mobile/providers/auth_provider.dart';
import 'package:betsy_mobile/providers/challenges_provider.dart';
import 'package:betsy_mobile/screens/bet_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesList = ref.watch(challengesNotifierProvider);
    final authActions = ref.read(asyncCurrentUserProvider.notifier);

    // return switch (challengesList) {
    //   AsyncData(:final value) => Text('value: ${value[0].id}'),
    //   AsyncError(:final error) => Text('error: $error'),
    //   _ => const Text('loading'),
    // };

    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: <Widget>[
            IconButton(
                onPressed: () => authActions.signOut(context),
                icon: const Icon(Icons.logout))
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
        body: switch (challengesList) {
          AsyncError(:final error) => Text('error: $error'),
          AsyncData(:final value) => Center(
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final challenge = value[index];
                  return GestureDetector(
                    onTap: () {
                      switch (challenge.status) {
                        case 0:
                          Navigator.pushNamed(context, "/bet-details",
                              arguments:
                                  BetDetailsScreenArguments(challenge.id));
                          break;
                        case 1:
                          if ("I_AM_CHALLANGED" == "I_AM_CHALLANGED") {
                            Navigator.pushNamed(context, "/challenge-proposal",
                                arguments: challenge);
                          }
                          break;
                        case 2:
                          Navigator.pushNamed(context, "/new-bet",
                              arguments: challenge);
                          break;
                        case 3:
                          Navigator.pushNamed(context, "/new-bet",
                              arguments: challenge);
                          break;
                        case 4:
                          Navigator.pushNamed(context, "/new-bet",
                              arguments: challenge);
                          break;
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: Colors.black26)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Column(
                                    children: [
                                      Icon(Icons.abc_rounded,
                                          color: Colors.black),
                                      SizedBox(width: 16),
                                      Icon(
                                        Icons.one_x_mobiledata,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 16),
                                      Icon(Icons.abc_rounded,
                                          color: Colors.black),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(challenge
                                                    .challenger.id
                                                    .toString())),
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
                                      const SizedBox(height: 20),
                                      IntrinsicWidth(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(challenge
                                                    .opponent.id
                                                    .toString())),
                                            const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Opponent",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IntrinsicWidth(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // const Icon(
                                      //   Icons.warning,
                                      //   color: Colors.black,
                                      // ),
                                      Column(
                                        children: [
                                          Text(challenge.status.toString()),
                                          const Text("Status"),
                                        ],
                                      )
                                    ],
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
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                IntrinsicWidth(
                                  child: Row(
                                    children: [
                                      // const Icon(
                                      //   Icons.warning,
                                      //   color: Colors.black,
                                      // ),
                                      Column(
                                        children: [
                                          Text(challenge.status.toString()),
                                          const Text("Status"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                IntrinsicWidth(
                                  child: Row(
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          _ => const Text('loading'),
        });
  }
}
