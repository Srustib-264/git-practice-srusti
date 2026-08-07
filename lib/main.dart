import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselearning/firebase_options.dart';
import 'package:firebaselearning/screens/signin.dart';
import 'package:flutter/material.dart';

import 'screens/siginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInPage(), // 👈 CHANGE THIS TO YOUR SIGN-IN PAGE
      debugShowCheckedModeBanner: false,
    );
  }
}
