import 'package:flutter/material.dart';

import '../API/APi-Manager.dart';
import '../API/model/responses/articles/Article.dart';

class SearchViewModel extends ChangeNotifier {
  SearchState state = SearchState();

  void getArticlesBySearch(String q) async {
    try {
      _sendState(
        SearchState(
          state: ScreenState.loading,
          loadingMessage: "Loading News Sources",
        ),
      );

      var response = await ApiManager.getInstance().getArticlesBySearch(q);

      if (response.status == "ok") {
        _sendState(
          SearchState(state: ScreenState.success, articles: response.articles),
        );
      }
      if (response.status == "error") {
        _sendState(
          SearchState(state: ScreenState.error, errorMessage: response.message),
        );
      }
    } catch (e) {
      _sendState(
        SearchState(state: ScreenState.error, errorMessage: e.toString()),
      );
    }
  }

  void _sendState(SearchState newState) {
    state = newState;
    notifyListeners();
  }

  void resetState() {
    state = ScreenState.initial as SearchState;
    notifyListeners();
  }
}

enum ScreenState { initial, loading, success, error }

class SearchState {
  ScreenState state = ScreenState.initial;

  List<Article>? articles;
  String? loadingMessage;
  String? errorMessage;

  SearchState({
    this.state = ScreenState.initial,
    this.articles,
    this.loadingMessage,
    this.errorMessage,
  });
}
