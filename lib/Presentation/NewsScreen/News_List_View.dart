import 'package:flutter/material.dart';
import 'package:news/Presentation/NewsScreen/widgets/ArticlesListWidget.dart';
import 'package:provider/provider.dart';
import '../../API/model/responses/sources/Source.dart';
import '../../View_Models/News_List_ViewModel.dart';

class NewsListView extends StatefulWidget {
  Source source;

  NewsListView({super.key, required this.source});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = NewsListViewModel();
    viewModel.getNewsArticles(widget.source.id ?? "");
  }

  @override
  void didUpdateWidget(covariant NewsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNewsArticles(widget.source.id ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,

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
