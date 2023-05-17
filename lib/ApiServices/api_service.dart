import 'dart:convert';
import 'package:xcenter_demo/Model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:xcenter_demo/Model/news_model.dart';

class AppUrl {
  static const String liveBaseURL =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-04-17&sortBy=publishedAt&apiKey=f95100d3689a4f378c075a20e16ed129";

// static const String baseURL = liveBaseURL;
// static const String login = baseURL + "/session";
// static const String register = baseURL + "/registration";
// static const String forgotPassword = baseURL + "/forgot-password";
}

//Api for News Page
Future<NewsModel> fetchNewsFromApi() async {
  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  final response =
      await http.get(Uri.parse(AppUrl.liveBaseURL), headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    return NewsModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load News/token expire');
  }
}
