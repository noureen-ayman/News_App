import 'package:flutter/material.dart';
import 'package:news/API/model/responses/articles/Article.dart';
import '../NewsCardView.dart';

class ArticlesListWidget extends StatelessWidget {
  List<Article> articles;

  ArticlesListWidget(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var article = articles[index];
        return NewsCardView(articleModel: article);
      },
      itemCount: articles.length,
    );
  }
}
