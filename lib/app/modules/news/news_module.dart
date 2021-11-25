import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/news/news_page.dart';
import 'package:suapifba/app/modules/news/repositories/news_repository.dart';
import 'package:suapifba/app/modules/news/stores/news_store.dart';

class NewsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => NewsRepository()),
    Bind((i) => NewsStore(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NewsPage()),
  ];
}
