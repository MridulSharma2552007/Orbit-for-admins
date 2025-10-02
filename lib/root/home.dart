import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit/Widgets/db_container.dart';
import 'package:orbit/Widgets/news_section.dart';
import 'package:orbit/colors/app_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Orbit',
                style: GoogleFonts.rubik(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundText,
                ),
              ),
              NewsSection(),
              const SizedBox(height: 20),
              SizedBox(child: DbContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
