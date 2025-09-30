import 'package:flutter/material.dart';
import 'package:orbit/colors/app_colors.dart';

class BottomSheetForm extends StatelessWidget {
  const BottomSheetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Contribute To Community',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(color: AppColors.backgroundText),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.primary.withValues(alpha: 0.9),
                    hintText: 'Enter Book Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    streamSelectionButton(text: 'BCA'),
                    streamSelectionButton(text: 'BBA'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class streamSelectionButton extends StatefulWidget {
  final String text;
  const streamSelectionButton({super.key, required this.text});

  @override
  State<streamSelectionButton> createState() => _streamSelectionButtonState();
}

class _streamSelectionButtonState extends State<streamSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.backgroundText,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(widget.text, style: TextStyle(color: AppColors.secondary)),
      ),
    );
  }
}
