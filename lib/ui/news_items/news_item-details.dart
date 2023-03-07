import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/model/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatefulWidget {
  static const String routeName = 'route name ';

  @override
  State<NewsItemDetails> createState() => _NewsItemDetailsState();
}

class _NewsItemDetailsState extends State<NewsItemDetails> {
  @override
  Widget build(BuildContext context) {
    var articals = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        title: Text(
          articals.source!.name ?? ' ',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              articals.urlToImage ?? " ",
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              articals.author ?? '',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              articals.content ?? '',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              formatDate(articals),
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('view more details',
                    style:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            )),
               IconButton(onPressed: (){
                 //openBrouser(articals.url ?? '');
                 openExternalBrouser(articals.url);
               }, icon:  Icon(Icons.arrow_forward_outlined)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  formatDate(Articles date) {
    DateFormat inputDate = DateFormat(date.publishedAt);
    DateFormat myFormat = DateFormat('yyy/mmm/dd-hh:mm a');
    DateTime inputFormat = inputDate.parse(date.publishedAt ?? ' ');
    return myFormat.format(inputFormat);
  }

  openBrouser(String? url) async {
    if(url == null)return;
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  openExternalBrouser(String? url) async {
    if(url == null)return;
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri , mode: LaunchMode.externalApplication)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
