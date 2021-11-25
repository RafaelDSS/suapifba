import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/news/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget {
  final List<NewsModel> items;

  const NewsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
          children: items.map((item) {
        return Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              title: Text(item.title),
              subtitle: Text(item.link),
              trailing: const Icon(Icons.link),
              onTap: () {
                launch(item.link);
              },
            ),
            const Divider(height: 1.0)
          ],
        );
      }).toList()),
    );
  }
}
