import 'package:flutter/material.dart';
import 'package:news/Presentation/NewsScreen/widgets/ArticlesListWidget.dart';
import 'package:provider/provider.dart';

import '../../API/model/responses/sources/Source.dart';
import '../../View_Models/News_List_ViewModel.dart';

class NewsListView extends StatelessWidget {
  final Source source;
  NewsListViewModel viewModel = NewsListViewModel();

  NewsListView({required this.source, super.key}) {
    viewModel.getNewsArticles(source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        body: Consumer<NewsListViewModel>(
          builder: (context, viewModel, child) {
            var screenState = viewModel.state;
            switch (screenState.state) {
              case ScreenState.initial:
              case ScreenState.loading:
                {
                  return Center(child: CircularProgressIndicator());
                }
              case ScreenState.error:
                {
                  return Center(
                    child: Text(
                      screenState.errorMessage ?? "Something Went Wrong",
                    ),
                  );
                }
              case ScreenState.success:
                {
                  return ArticlesListWidget(screenState.articles ?? []);
                }
            }
          },
        ),
      ),
    );
  }
}
