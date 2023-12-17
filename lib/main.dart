import 'package:betsy_mobile/providers/challenges_provider.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:betsy_mobile/providers/current_user_bets_provider.dart';
import 'package:betsy_mobile/screens/auth_screen.dart';
import 'package:betsy_mobile/screens/challenge_details_screen.dart';
import 'package:betsy_mobile/screens/challenge_screen.dart';
import 'package:betsy_mobile/screens/dashboard_screen.dart';
import 'package:betsy_mobile/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

const List<String> scopes = <String>[
  'email',
  'profile',
];

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentAPIUserProvider);
    ref.watch(currentUserBetsProvider);
    ref.watch(challengesNotifierProvider);

    return MaterialApp(
      title: 'Betsy',
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      theme: lightTheme,
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/bet-details': (context) => const BetDetailsScreen(),
        '/new-challenge': (context) => const ChallengeScreen(),
        '/summary': (context) => const AuthScreen()
      },
    );
  }
}
