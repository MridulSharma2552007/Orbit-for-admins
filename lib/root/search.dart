import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search notes...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Static result count
            const Text(
              "132 results",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 2),

            // Grid of notes
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7, // adjust for height of image + text
                children: List.generate(4, (index) {
                  return _noteCard('assets/images/note.jpg', 'Physics Notes', 4, 50);
                }),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7, // adjust for height of image + text
                children: List.generate(4, (index) {
                  return _noteCard('assets/images/note.jpg', 'Chemistry Notes', 4, 50);
                }),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7, // adjust for height of image + text
                children: List.generate(4, (index) {
                  return _noteCard('assets/images/note.jpg', 'Maths Notes', 4, 50);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Note card widget
  Widget _noteCard(String imagePath, String title, int stars, double price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Container(
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 5),
        // Title
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        // Star rating
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < stars ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            );
          }),
        ),
        const SizedBox(height: 3),
        // Price
        Text(
          '\$$price',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
