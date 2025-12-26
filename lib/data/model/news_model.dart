import 'package:hive_flutter/adapters.dart';
part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String source;
  @HiveField(3)
  final String time;
  @HiveField(4)
  final String content;
  @HiveField(5)
  final String description;

  NewsModel({
    required this.title,
    required this.image,
    required this.source,
    required this.time,
    required this.content,
    required this.description,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      source: json["source"]["name"] ?? "",
      time: json["publishedAt"] ?? "",
      content: json["content"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
