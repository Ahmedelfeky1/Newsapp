
import 'package:dio/dio.dart';
import '../model/news_model.dart';

class ApiServies {
  final dio = Dio();
  static const String apiKey = "3439c4780784b6e7568413faea06fcc4";
  static const String baseUrl = "https://gnews.io/api/v4";

  ApiServies() {
    dio.options = BaseOptions(
      receiveTimeout: Duration(milliseconds: 10000),
      connectTimeout: Duration(milliseconds: 10000),
    );
  }
  Future<List<NewsModel>> getTopHeadlines({
    String category = "general",
    String lang = "en",
    String country = "us",
  }) async {
    try {
      final response = await dio.get(
        "$baseUrl/top-headlines",
        queryParameters: {
          "category": category,
          "lang": lang,
          "country": country,
          "apikey": apiKey,
        },
      );
      List news = response.data["articles"];
      return news.map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to Load data");
    }
  }

  Future<List<NewsModel>> searchNews({
    required String q ,
  }) async {
    try {
      final response = await dio.get(
        "$baseUrl/search",
        queryParameters: {
          "q": q,
          "lang": "en",
          "country": "us",
          "apikey": apiKey,
        },
      );
      List news = response.data["articles"];
      return news.map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to Load data");
    }
  }

}
