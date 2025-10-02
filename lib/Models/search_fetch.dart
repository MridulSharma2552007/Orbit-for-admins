import 'package:orbit/Models/search_items.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;


Future<List<SearchItems>> fetchSearchData(String query) async {
  final response = await supabase
      .from('Documents')
      .select('*')
      .ilike('title', '%$query%') 
      .order('id', ascending: false);

  final data = response as List<dynamic>;
  return data
      .map((item) => SearchItems.fromMap(item as Map<String, dynamic>))
      .toList();
}
