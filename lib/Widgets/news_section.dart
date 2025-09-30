import 'package:flutter/material.dart';
import 'package:orbit/colors/app_colors.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'News',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Divider(color: AppColors.backgroundText),

          const SizedBox(height: 20),

          // Horizontal list of news cards
          SizedBox(
            height: 200, // fixed height for news cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // change as per your data
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                  ), // spacing between cards
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondary,
                  ),
                  child: Center(
                    child: Text(
                      'News ${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
