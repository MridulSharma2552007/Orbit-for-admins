import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final TextEditingController controllerforanouncement =
        TextEditingController();
    Future<void> pushNewsToDB(String announce) async {
      try {
        final response = await Supabase.instance.client.from('News').insert({
          'title': announce,
        });
        // If successful, response.error will be null
        print("✅ News inserted successfully!");
      } catch (e) {
        print("❌ Error inserting news: $e");
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Create Announcement",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Type your announcement below",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: controllerforanouncement,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Enter announcement...",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                final announcement = controllerforanouncement.text.trim();
                pushNewsToDB(announcement);
                if (announcement.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Announcement Created!")),
                  );
                  controllerforanouncement.clear();
                }
              },
              child: Text(
                "Post Announcement",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
