import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/TabsResponse.dart';
import '../model/News_response.dart';
class ApiMAnger{
/// https://newsapi.org/v2/top-headlines/sources?apiKey=4aac8480a2074eefa0fe7a662b4cca3c&category=sports
  static const String baseUrl = 'https://newsapi.org';
  static const String apiKey = '4aac8480a2074eefa0fe7a662b4cca3c';
   static Future<TabsResponse> getResourses(String category)async{
    var response = await http.get(Uri.parse('$baseUrl/v2/top-headlines/sources?apiKey=$apiKey&category=$category'));
    return TabsResponse.fromJson(jsonDecode(response.body));
  }
  static Future<NewsResponse> getNews( String chanalId,)async{
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?apiKey=4aac8480a2074eefa0fe7a662b4cca3c&sources=$chanalId')
    );
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
  // static Future<NewsResponse> getNewsSearch (String search) async {
  //    var response = await http.get(Uri.parse( 'https://newsapi.org/v2/everything?apiKey=4aac8480a2074eefa0fe7a662b4cca3c&q=$search'));
  //    return NewsResponse.fromJson(jsonDecode(response.body));
  // }


}