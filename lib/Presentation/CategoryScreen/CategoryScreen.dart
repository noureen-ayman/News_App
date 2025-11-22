import 'package:flutter/material.dart';
import 'package:news/AppCore/extensions/context_extensions.dart';

import '../../data/CategoryCardModel/CategoryCardModel.dart';
import '../../l10n/app_localizations.dart';
import 'CategoryCardView.dart';

typedef OnCategoryClick = void Function(CategoryModel category);

class CategoryScreen extends StatelessWidget {
  OnCategoryClick? onCategoryClick;

  CategoryScreen(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              l10n.goodMorningHereIsSomeNewsForYou,
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
