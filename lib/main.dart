import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lalal/auth/login.dart';
import 'package:lalal/firebase_options.dart';
import 'package:lalal/screens/future_and_stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: futureAndStream(),
    );
  }
}
