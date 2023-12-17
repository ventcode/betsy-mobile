import 'package:betsy_mobile/providers/challenges_provider.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:betsy_mobile/providers/current_user_provider.dart';
import 'package:betsy_mobile/screens/challenge_details_screen.dart';
import 'package:betsy_mobile/widgets/challenge_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesList = ref.watch(challengesNotifierProvider);
    final currentAPIUser = ref.watch(currentAPIUserProvider);
    final authActions = ref.read(asyncCurrentUserProvider.notifier);

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
                            case 1:
                            case 2:
                              Navigator.pushNamed(context, "/bet-details",
                                  arguments:
                                      BetDetailsScreenArguments(challenge.id));
                              break;
                          }
                        },
                        child: ChallengeTile(challenge: challenge));
                  }),
            ),
          _ => const Text('loading'),
        });
  }
}
