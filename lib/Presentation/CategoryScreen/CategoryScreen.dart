import 'package:flutter/material.dart';
import 'package:news/AppCore/extentions/context_extentions.dart';
import '../../data/CategoryCardModel/CategoryCardModel.dart';
import 'CategoryCardView.dart';

typedef OnCategoryClick = void Function(CategoryModel category);

class CategoryScreen extends StatelessWidget {
  OnCategoryClick? onCategoryClick;

  CategoryScreen(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Good Morning\nHere is Some News For You",
              style: context.fonts.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final category = CategoryModel.categories[index];
                return InkWell(
                  onTap: () {
                    onCategoryClick!(category);
                  },
                  child: CategoryCard(category: category, index: index),
                );
              },
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
