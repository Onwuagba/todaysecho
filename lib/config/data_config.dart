import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ContentData {
  final String? content, publishedAt, title, author;
  final urlImage;

  ContentData(
      {required this.content,
      required this.publishedAt,
      required this.title,
      required this.author,
      required this.urlImage});

  factory ContentData.fromJson(Map<String, dynamic> json) {
    return ContentData(
        content: json['content'],
        publishedAt: json['publishedAt'],
        urlImage: json['urlToImage'],
        author: json['author'],
        title: json['title']);
  }
}

Future<List<ContentData>> getNewsContent() async {
  var url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=${dotenv.env['apiKey']}");
  try {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson['articles'] as List)
          .map((p) => ContentData.fromJson(p))
          .toList();
    } else {
      throw Exception("Could not get contents");
    }
  } catch (e) {
    throw Exception();
  }
}
