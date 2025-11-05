import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../View_Models/News_Sources_List_ViewModel.dart';
import '../../data/CategoryCardModel/CategoryCardModel.dart';
import 'widgets/News_Sources_List_Widget.dart';

class NewsScreen extends StatelessWidget {
  NewsSourcesListViewModel viewModel = NewsSourcesListViewModel();
  CategoryModel? category;

  NewsScreen({super.key, required this.category}) {
    viewModel.getNewsSources(category?.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,

      child: Scaffold(
        body: Consumer<NewsSourcesListViewModel>(
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
                  return NewsSourcesListWidget(screenState.sources ?? []);
                }
            }
          },
        ),
      ),
    );
  }
}
