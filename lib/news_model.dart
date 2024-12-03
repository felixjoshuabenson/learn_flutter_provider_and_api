class NewsModel {
  NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'] ?? "No Title",
        description: json['description'] ?? "No Descrition",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "");
  }
}
