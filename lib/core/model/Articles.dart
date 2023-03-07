import 'Sources.dart';

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "The Associated Press"
/// title : "St. Louis Zoo bear has second brief escape from enclosure"
/// description : "For the second time in a month, a bear at the St. Louis Zoo figured out how to get out of his enclosure and enjoy a brief taste of freedom"
/// url : "https://abcnews.go.com/US/wireStory/st-louis-zoo-bear-brief-escape-enclosure-97454553"
/// urlToImage : "https://s.abcnews.com/images/US/abc_news_default_2000x2000_update_16x9_992.jpg"
/// publishedAt : "2023-02-24T22:11:45Z"
/// content : "ST. LOUIS -- St. Louis Zoo officials say they are working to find a way to keep an Andean bear named Ben inside his enclosure after he escaped Thursday for the second time this month. \r\nThe bear, nam… [+832 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? MyTab.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  MyTab? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}