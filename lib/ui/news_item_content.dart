import 'package:news_app/core/api/api_manger.dart';
import 'package:news_app/core/model/TabsResponse.dart';
import 'package:news_app/ui/tabs_items/tabs_item.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/tabs_items/tab_bar_list.dart';

class NewsItemContent extends StatelessWidget {
  Category category;
  NewsItemContent({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<TabsResponse>(
        future: ApiMAnger.getResourses(category.id ?? ""),
        builder: (_ , snapshot){
          if(snapshot.hasError){
            return Text('something went wrong ${snapshot.error}');
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else{
            return TabListBar(snapshot.data!.tabs!);
          }
        },
      ),
    );
  }
}
