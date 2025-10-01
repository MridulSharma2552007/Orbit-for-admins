class DbItems {
  final int id;
  final String title;
  final String url;
  final String stream;

  DbItems({
    required this.id,
    required this.title,
    required this.url,
    required this.stream,
  });

  factory DbItems.fromMap(Map<String, dynamic> map) {
    return DbItems(
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      stream: map['stream'] as String,
    );
  }
}
