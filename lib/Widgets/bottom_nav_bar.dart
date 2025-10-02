import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:orbit/colors/app_colors.dart';
import 'package:orbit/root/bookspage.dart';
import 'package:orbit/root/home.dart';
import 'package:orbit/root/search.dart';
import 'package:orbit/root/aboutdev.dart';

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
    Icon(Icons.code_rounded, size: 30, color: Colors.white),
  ];
  final List<Widget> _pages = [
    const Home(),
    Search(),
    const BooksPage(),
    const AboutDevTerminal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        backgroundColor: AppColors.primary,
        color: AppColors.secondary,
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
