import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit/colors/app_colors.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              // Quote at the top
              Text(
                '“No matter what anybody tells you, words and ideas can change the world.” – John Keating',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    color: Color(0xff708993),
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
                

              const SizedBox(height: 30),

              // Contribution image
              Expanded(
                child: Image.asset(
                  "assets/images/snowman.png",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // Upload container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.upload_rounded, size: 80, color: Colors.white),
                    const SizedBox(height: 15),
                    Text(
                      'Upload your books',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Contribute your books & notes – make learning easier for everyone.',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
