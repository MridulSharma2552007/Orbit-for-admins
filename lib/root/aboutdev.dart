import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutdev extends StatelessWidget {
  const Aboutdev({super.key});

  // Function to open links
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extra colors for styling
    const Color gradientStart = Color(0xffFF6B6B);
    const Color gradientEnd = Color(0xffFFD93D);
    const Color cardColor = Color(0xff2A2A2D);
    const Color highlight = Color(0xff4ECDC4);

    return Scaffold(
      backgroundColor: const Color(0xff1C1C1E),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gradient Title
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [gradientStart, gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "Orbit Developers",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Dev Card - Mridul
                _buildDevCard(
                  name: "Mridul Sharma",
                  role: "Lead Developer",
                  github: "https://github.com/MridulSharma2552007/Orbit",
                  linkedin:
                      "https://www.linkedin.com/in/mridul-sharma-a48604319/",
                  color: highlight,
                  cardColor: cardColor,
                ),

                const SizedBox(height: 20),

                // Dev Card - Shaurya
                _buildDevCard(
                  name: "Shaurya",
                  role: "Contributor",
                  github: "https://github.com/Shaurya0987",
                  linkedin: "",
                  color: gradientEnd,
                  cardColor: cardColor,
                ),

                const SizedBox(height: 40),

                // Footer
                Text(
                  "Made with ❤️ using Flutter",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for developer cards
  Widget _buildDevCard({
    required String name,
    required String role,
    required String github,
    required String linkedin,
    required Color color,
    required Color cardColor,
  }) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, double value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Icon
            CircleAvatar(
              radius: 35,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(Icons.person, color: color, size: 40),
            ),
            const SizedBox(height: 15),

            // Name
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            // Role
            Text(
              role,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),

            const SizedBox(height: 15),

            // Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (github.isNotEmpty)
                  IconButton(
                    onPressed: () => _launchUrl(github),
                    icon: const Icon(Icons.code),
                    color: Colors.white,
                  ),
                if (linkedin.isNotEmpty)
                  IconButton(
                    onPressed: () => _launchUrl(linkedin),
                    icon: const Icon(Icons.business),
                    color: Colors.white,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
