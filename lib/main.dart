import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_sample/home_page.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase UI Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(15.0),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(24),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}