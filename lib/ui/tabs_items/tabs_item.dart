import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  int index;
  Category category;
  Function function;
  NewsItem(
      {required this.index, required this.category, required this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function(category);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 22),
              bottomLeft: Radius.circular(index % 2 == 0 ? 22 : 0),
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
            color: category.backColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(category.imageLogo),
            // SizedBox(
            //   height: 8,
            // ),
            Text(
              category.imageTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  String id;
  Color backColor;
  String imageLogo;
  String imageTitle;
  Category(
      {required this.id,
      required this.imageLogo,
      required this.imageTitle,
      required this.backColor});
}
