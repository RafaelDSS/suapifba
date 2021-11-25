import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/news/models/news.dart';
import 'package:suapifba/app/modules/news/stores/news_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:suapifba/app/shared/components/modal_progress.dart';
import 'package:suapifba/app/shared/helpers/store_observer.dart';
import 'components/item_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final newsStore = Modular.get<NewsStore>();

  late Disposer _disposerPeriod;

  @override
  void initState() {
    super.initState();
    newsStore.getNews();

    _disposerPeriod = defaultStoreObserver(
      context: context,
      store: newsStore,
      onLoading: (loading) {},
    );
  }

  @override
  void dispose() {
    super.dispose();
    newsStore.destroy();
    _disposerPeriod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: "Notícias"),
      body: Stack(
        children: [
          ScopedBuilder<NewsStore, Exception, List<NewsModel>>(
            store: newsStore,
            onState: (context, state) => NewsList(items: state),
            onLoading: (context) => const ModalProgress(),
            onError: (context, error) => Container(),
          ),
        ],
      ),
    );
  }
}
