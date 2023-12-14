import 'package:betsy_mobile/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Betsy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/dasboard': (context) => const AuthScreen(),
        '/new-bet': (context) => const AuthScreen(),
        '/bet-details': (context) => const AuthScreen(),
        '/challenge': (context) => const AuthScreen(),
        '/summary': (context) => const AuthScreen(),
      },
    );
  }
}
