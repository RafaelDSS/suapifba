import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/news/models/news.dart';
import 'package:suapifba/app/modules/news/repositories/news_repository.dart';

class NewsStore extends StreamStore<Exception, List<NewsModel>> {
  final NewsRepository newsRepository;

  NewsStore(this.newsRepository) : super([]);

  getNews() {
    execute(() => newsRepository.fetchNews());
  }
}
