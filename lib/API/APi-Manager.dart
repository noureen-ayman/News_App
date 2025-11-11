import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/API/api_config.dart';
import 'package:news/API/model/responses/articles/ArticlesResponse.dart';
import 'package:news/API/model/responses/search/SearchResponse.dart';
import 'package:news/API/model/responses/sources/SourcesResponse.dart';

class ApiManager {

  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourcesResponse> getNewsSources(String category) async {
    var params = {"category": category};
    var headers = {"Authorization": ApiConfig.apiKey};
    var uri = Uri.https(ApiConfig.baseUrl, ApiConfig.sourceApi, params);
    var response = await http.get(uri, headers: headers);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

    return sourcesResponse;
  }

  Future<ArticlesResponse> getNewsArticles(String sourceId) async {
    var params = {"sources": sourceId};
    var headers = {"Authorization": ApiConfig.apiKey};
    var uri = Uri.https(ApiConfig.baseUrl, ApiConfig.articlesApi, params);
    var response = await http.get(uri, headers: headers);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

    return articlesResponse;
  }

  Future<SearchResponse> getArticlesBySearch(String q) async {
    var params = {"q": q, "language": 'en'};
    var headers = {"Authorization": ApiConfig.apiKey};
    var uri = Uri.https(ApiConfig.baseUrl, ApiConfig.articlesApi, params);
    var response = await http.get(uri, headers: headers);
    var json = jsonDecode(response.body);
    SearchResponse searchResponse = SearchResponse.fromJson(json);

    return searchResponse;
  }
}
