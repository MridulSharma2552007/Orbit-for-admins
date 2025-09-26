import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:orbit/root/bookspage.dart';
import 'package:orbit/root/home.dart';
import 'package:orbit/root/search.dart';
import 'package:orbit/root/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final List<Widget> _navItems = const [
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.search, size: 30, color: Colors.white),
    Icon(Icons.book, size: 30, color: Colors.white),
    Icon(Icons.settings, size: 30, color: Colors.white),
  ];
  final List<Widget> _pages = const [Home(), Search(), Bookspage(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        backgroundColor: Colors.white,
        color: Colors.blueAccent.withValues(alpha: 0.8),
        items: _navItems,
        index: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pages[_page],
    );
  }
}
