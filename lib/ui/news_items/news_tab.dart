import 'package:flutter/material.dart';
import '../../core/api/api_manger.dart';
import '../../core/model/Sources.dart';
import '../../core/model/News_response.dart';
import 'news_widget.dart';

class NewsTab extends StatelessWidget {
  MyTab tab;
  NewsTab(this.tab);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiMAnger.getNews(tab.id ?? " "),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text('something went wrong ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (_, index) {
                return NewsWidget(snapshot.data!.articles![index]);
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
