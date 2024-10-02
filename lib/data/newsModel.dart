
import 'package:news_app/core/app_strings.dart';

class NewsModel {
  String? title, author, urlToImage, description, publishAt;

  NewsModel(
      {required this.title,
        required this.author,
        required this.urlToImage,
        required this.description,
        required this.publishAt});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'],
        author: json['author'],
        urlToImage: json['urlToImage'] ?? AppStrings.newsImage,
        description: json['description'],
        publishAt: json['publishedAt']);
  }
}