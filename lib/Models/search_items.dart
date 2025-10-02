class SearchItems {
  final int id;
  final String title;
  final DateTime date;

  final String url;

  SearchItems({
    required this.date,
    required this.id,
    required this.title,
    required this.url,
  });
  factory SearchItems.fromMap(Map<String, dynamic> map) {
    return SearchItems(
      date: DateTime.parse(map['data'] as String),
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
    );
  }
}
