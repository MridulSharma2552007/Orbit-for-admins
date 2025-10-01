import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> uploadFile({
  required PlatformFile file,
  required String title,
  required String stream,
}) async {
  final supabase = Supabase.instance.client;

  try {
    final filePath = 'uploads/${file.name}';

    // Upload file to Supabase Storage
    await supabase.storage.from('UsersUploads').uploadBinary(
          filePath,
          File(file.path!).readAsBytesSync(),
          fileOptions: const FileOptions(upsert: true),
        );

    // Get Public URL
    final publicUrl =
        supabase.storage.from('UsersUploads').getPublicUrl(filePath);

    print("✅ File uploaded: $publicUrl");

    // Insert into Supabase DB
    await supabase.from('Documents').insert({
      'title': title,
      'stream': stream,
      'url': publicUrl,
    });
  } catch (e) {
    print("❌ Upload error: $e");
  }
}
