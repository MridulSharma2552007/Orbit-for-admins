import 'package:flutter/material.dart';
import 'package:orbit/Models/db_fetch.dart';
import 'package:orbit/Models/db_items.dart';
import 'package:orbit/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DbContainer extends StatefulWidget {
  const DbContainer({super.key});

  @override
  State<DbContainer> createState() => _DbContainerState();
}

class _DbContainerState extends State<DbContainer> {
  List<DbItems> dbdata = [];
  bool isLoading = true;

  Future<void> loaddata() async {
    final fetcheddata = await fetchDbData();
    setState(() {
      dbdata = fetcheddata;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void _openFile(BuildContext context, String url) async {
    final uri = Uri.parse(url);

    if (url.toLowerCase().endsWith('.pdf')) {
      // Open PDF inside app
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("PDF Viewer")),
            body: SfPdfViewer.network(url),
          ),
        ),
      );
    } else if (url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg') ||
        url.toLowerCase().endsWith('.png')) {
      // Open Image inside app
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Image Viewer")),
            body: Center(child: InteractiveViewer(child: Image.network(url))),
          ),
        ),
      );
    } else {
      // Fallback: open in browser
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dbdata.length,
      itemBuilder: (context, index) {
        final dbitems = dbdata[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    dbitems.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundText,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Stream badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      dbitems.stream,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Open File Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      onPressed: () => _openFile(context, dbitems.url),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      icon: const Icon(Icons.open_in_new, color: Colors.white),
                      label: const Text(
                        "Open",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
