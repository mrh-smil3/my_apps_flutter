import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return MaterialApp(
      title: 'Flutter Appwrite Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user == null ? LoginScreen() : HomeScreen(),
    );
  }
}
