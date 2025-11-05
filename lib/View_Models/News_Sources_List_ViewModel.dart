import 'package:flutter/material.dart';

import '../API/APi-Manager.dart';
import '../API/model/responses/sources/Source.dart';

class NewsSourcesListViewModel extends ChangeNotifier {
  CategoryDetailsState state = CategoryDetailsState();

  void getNewsSources(String categoryId) async {
    try {
      _sendState(
        CategoryDetailsState(
          state: ScreenState.loading,
          loadingMessage: "Loading News Sources",
        ),
      );

      var response = await ApiManager.getInstance().getNewsSources(categoryId);

      if (response.status == "ok") {
        _sendState(
          CategoryDetailsState(
            state: ScreenState.success,
            sources: response.sources,
          ),
        );
      }
      if (response.status == "error") {
        _sendState(
          CategoryDetailsState(
            state: ScreenState.error,
            errorMessage: response.message,
          ),
        );
      }
    } catch (e) {
      _sendState(
        CategoryDetailsState(
          state: ScreenState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _sendState(CategoryDetailsState newState) {
    state = newState;
    notifyListeners();
  }
}

enum ScreenState { initial, loading, success, error }

class CategoryDetailsState {
  ScreenState state = ScreenState.initial;

  List<Source>? sources;
  String? loadingMessage;
  String? errorMessage;

  CategoryDetailsState({
    this.state = ScreenState.initial,
    this.sources,
    this.loadingMessage,
    this.errorMessage,
  });
}
