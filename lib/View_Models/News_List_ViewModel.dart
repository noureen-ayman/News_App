import 'package:flutter/material.dart';
import '../API/APi-Manager.dart';
import '../API/model/responses/articles/Article.dart';

class NewsListViewModel extends ChangeNotifier {
  NewsListState state = NewsListState();

  void getNewsArticles(String sourceId) async {
    try {
      _sendState(
        NewsListState(
          state: ScreenState.loading,
          loadingMessage: "Loading News Sources",
        ),
      );

      var response = await ApiManager.getInstance().getNewsArticles(sourceId);

      if (response.status == "ok") {
        _sendState(
          NewsListState(
            state: ScreenState.success,
            articles: response.articles,
          ),
        );
      }
      if (response.status == "error") {
        _sendState(
          NewsListState(
            state: ScreenState.error,
            errorMessage: response.message,
          ),
        );
      }
    } catch (e) {
      _sendState(
        NewsListState(state: ScreenState.error, errorMessage: e.toString()),
      );
    }
  }

  void _sendState(NewsListState newState) {
    state = newState;
    notifyListeners();
  }
}

enum ScreenState { initial, loading, success, error }

class NewsListState {
  ScreenState state = ScreenState.initial;

  List<Article>? articles;
  String? loadingMessage;
  String? errorMessage;

  NewsListState({
    this.state = ScreenState.initial,
    this.articles,
    this.loadingMessage,
    this.errorMessage,
  });
}
