class NewsItems {
  final int id;
  final String title;
  final DateTime date;
  NewsItems({required this.id, required this.title, required this.date});

  factory NewsItems.fromMap(Map<String, dynamic> map) {
    return NewsItems(
      id: map['id'] as int,
      title: map['title'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }
}
