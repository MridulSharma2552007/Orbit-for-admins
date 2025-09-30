import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orbit/firebase_options.dart';
import 'package:orbit/intros/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://noifftnvujdyanqvukmg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vaWZmdG52dWpkeWFucXZ1a21nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyMDMwOTUsImV4cCI6MjA3NDc3OTA5NX0.fkb14Yor9uhvDMzI9Bj5MetN02O32P9050cFPzoGCno',
  );
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
