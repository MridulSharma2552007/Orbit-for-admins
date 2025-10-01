import 'package:orbit/Models/db_items.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<List<DbItems>> fetchDbData() async {
  final response = await supabase
      .from('Documents')
      .select('*')
      .order('id', ascending: false);
  final data = response as List<dynamic>;
  return data
      .map((item) => DbItems.fromMap(item as Map<String, dynamic>))
      .toList();
}
