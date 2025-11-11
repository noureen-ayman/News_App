import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../View_Models/Search_viewModel.dart';
import '../NewsScreen/widgets/ArticlesListWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(
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
                child: Text(screenState.errorMessage ?? "Something Went Wrong"),
              );
            }
          case ScreenState.success:
            {
              return ArticlesListWidget(screenState.articles ?? []);
            }
        }
      },
    );
  }
}
