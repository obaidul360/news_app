import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=f53881c1495a4ba3959641797db070ca";
  final breaking_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=f53881c1495a4ba3959641797db070ca";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleslist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleslist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw e;
    }
  }
}
