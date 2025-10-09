import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orbit/firebase_options.dart';
import 'package:orbit/intros/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: '', anonKey: '');
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Splash()),
    );
  }
}
