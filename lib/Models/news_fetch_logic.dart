import 'package:orbit/Models/news_items.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<List<NewsItems>> fetchNews() async {
  final response = await supabase
      .from('News')
      .select('*')
      .order('date', ascending: false);

  // response is now List<dynamic> directly

  final data = response as List<dynamic>;
  return data
      .map((item) => NewsItems.fromMap(item as Map<String, dynamic>))
      .toList();
}
