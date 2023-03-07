import 'package:flutter/material.dart';
import 'package:news_app/ui/news_items/news_item-details.dart';

import '../../core/model/Articles.dart';
class NewsWidget extends StatelessWidget {
  Articles articles ;
NewsWidget(this.articles);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsItemDetails.routeName , arguments:articles );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(articles.urlToImage??" " ,
            ),
            const SizedBox(height: 6,),
            Text(articles.author??'' ,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 10 ,
              fontWeight: FontWeight.normal,
            ),
            ),
            const SizedBox(height: 6,),
            Text(articles.title??'' ,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14 ,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 6,),
            Text(articles.publishedAt??'' ,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14 ,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
