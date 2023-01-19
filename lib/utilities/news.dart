import '../models/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String apiKey = 'fd4c1cf71dae4c2b8e8eeeaf09a1d833';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=fd4c1cf71dae4c2b8e8eeeaf09a1d833';
    http.Response response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['url'] != null) {
          ArticleModel articleModel = ArticleModel(
              url: element['url'],
              title: element['title'],
              author: element['author'],
              content: element['content'],
              description: element['description'],
              urlToImage: element['urlToImage']);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=fd4c1cf71dae4c2b8e8eeeaf09a1d833';
    http.Response response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['url'] != null &&
            element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
              url: element['url'],
              title: element['title'],
              author: element['author'],
              content: element['content'],
              description: element['description'],
              urlToImage: element['urlToImage']);

          news.add(articleModel);
        }
      });
    }
  }
}
