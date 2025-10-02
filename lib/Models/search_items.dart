class SearchItems {
  final String title;
  final String url;
  final DateTime date;

  SearchItems({required this.title, required this.url, required this.date});

  factory SearchItems.fromMap(Map<String, dynamic> map) {
    return SearchItems(
      title: map['title'] ?? "Untitled", // default if null
      url: map['url'] ?? "", // default if null
      date: map['date'] != null
          ? DateTime.parse(map['date'])
          : DateTime.now(),
    );
  }
}
