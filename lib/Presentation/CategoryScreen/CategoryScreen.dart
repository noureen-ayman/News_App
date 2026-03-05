import 'package:flutter/material.dart';
import 'package:news/AppCore/extensions/context_extensions.dart';

import '../../data/CategoryCardModel/CategoryCardModel.dart';
import '../../l10n/app_localizations.dart';
import 'CategoryCardView.dart';

typedef OnCategoryClick = void Function(CategoryModel category);

class CategoryScreen extends StatelessWidget {
  final OnCategoryClick? onCategoryClick;

  const CategoryScreen(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: ListView.builder(
        itemCount: CategoryModel.categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.goodMorningHereIsSomeNewsForYou,
                    style: context.fonts.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          final category = CategoryModel.categories[index - 1];
          return CategoryCard(
            category: category,
            index: index - 1,
            onTap: () => onCategoryClick?.call(category),
          );
        },
      ),
    );
  }
}
