import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:suapifba/app/modules/news/models/news.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class NewsRepository {
  Future<List<NewsModel>> fetchNews() async {
    final dio = Dio();

    try {
      final response = await dio.get(config.urlNews);

      if (response.statusCode == 200) {
        return newsModelFromJson(response.data["data"]);
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception("Ocorreu um erro ao requisitar as notícias.");
  }
}
