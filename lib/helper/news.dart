import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app_api/secret.dart';
import 'package:news_app_api/views/models/article.dart';

class News {
  List<Article> news = [];
  Future<void> getNews() async {
    // String url =
    //     "http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=43f77d661bc24d89b056c56c9749edde";

    // var response = await http.get(url);
    var response = await http.get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=43f77d661bc24d89b056c56c9749edde'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    // String url =
    //     "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=43f77d661bc24d89b056c56c9749edde";

    var response = await http.get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=43f77d661bc24d89b056c56c9749edde'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
