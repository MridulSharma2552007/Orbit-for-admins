import 'package:flutter/material.dart';
import 'package:orbit/login/login_page.dart';
import 'package:orbit/root/root.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authchecker extends StatefulWidget {
  const Authchecker({super.key});

  @override
  State<Authchecker> createState() => _AuthcheckerState();
}

class _AuthcheckerState extends State<Authchecker> {
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Root()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
