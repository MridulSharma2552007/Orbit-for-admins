import 'package:flutter/material.dart';
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
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundText,
                ),
              ),
              NewsSection(),
              const SizedBox(height: 20),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true, // 🔑 fixes unbounded height
                  physics:
                      NeverScrollableScrollPhysics(), // disable inner scroll
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: resourceContainer(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class resourceContainer extends StatelessWidget {
  const resourceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
