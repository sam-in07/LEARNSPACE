import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnsphere/firebase_options.dart';
import 'package:learnsphere/screens/Splashscreen.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Sphere',
      debugShowCheckedModeBanner: false,
      home:  Splashscreen(),
    );
  }
}


