import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/API/model/responses/articles/ArticlesResponse.dart';
import 'package:news/API/model/responses/sources/SourcesResponse.dart';

class ApiManager {
  static const String _baseUrl = "newsapi.org";
  static const String _sourceApi = "v2/top-headlines/sources";
  static const String _articlesApi = "v2/everything";
  static const String _apiKey = "968fd41ec2374fd0993757c03039a0c1";

  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourcesResponse> getNewsSources(String category) async {
    var params = {"category": category};
    var headers = {"Authorization": _apiKey};
    var uri = Uri.https(_baseUrl, _sourceApi, params);
    var response = await http.get(uri, headers: headers);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

    return sourcesResponse;
  }

  Future<ArticlesResponse> getNewsArticles(String sourceId) async {
    var params = {"sources": sourceId};
    var headers = {"Authorization": _apiKey};
    var uri = Uri.https(_baseUrl, _articlesApi, params);
    var response = await http.get(uri, headers: headers);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

    return articlesResponse;
  }
}

//https://newsapi.org/v2/top-headlines/sources?apiKey=968fd41ec2374fd0993757c03039a0c1
//https://newsapi.org/v2/everything?apiKey=968fd41ec2374fd0993757c03039a0c1&sources=bbc-sport
