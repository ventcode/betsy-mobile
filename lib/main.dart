import 'package:betsy_mobile/screens/auth_screen.dart';
import 'package:betsy_mobile/screens/bet_details_screen.dart';
import 'package:betsy_mobile/screens/challenge_proposal_screen.dart';
import 'package:betsy_mobile/screens/challenge_screen.dart';
import 'package:betsy_mobile/screens/dashboard_screen.dart';
import 'package:betsy_mobile/screens/new_bet_screen.dart';
import 'package:betsy_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp(
      title: 'Betsy',
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      theme: lightTheme,
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/new-bet': (context) => const NewBetScreen(),
        '/bet-details': (context) => const BetDetailsScreen(),
        '/new-challenge': (context) => const ChallengeScreen(),
        '/challenge-proposal': (context) => const ChallengeProposalScreen(),
        '/summary': (context) => const AuthScreen()
      },
    );
  }
}
