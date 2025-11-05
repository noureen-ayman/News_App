import 'package:flutter/material.dart';
import 'package:news/AppCore/AppColors/AppColors.dart';
import 'package:news/AppCore/extentions/context_extentions.dart';
import 'package:provider/provider.dart';
import '../../AppCore/providers/ThemeProvider.dart';
import '../../data/CategoryCardModel/CategoryCardModel.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final int index;

  const CategoryCard({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isEven = index.isEven;
    final isDark = themeProvider.isDark;

    final cardBgColor = isDark ? AppColors.white : AppColors.grey;
    final titleColor = isDark ? AppColors.black : AppColors.white;

    final buttonTextColor = isDark ? AppColors.white : AppColors.black;
    final iconBgColor = isDark ? AppColors.black : AppColors.white;
    final buttonBgColor = isDark
        ? AppColors.black.withAlpha(124)
        : AppColors.white.withAlpha(124);

    final icon = isEven
        ? Icons.arrow_forward_ios_outlined
        : Icons.arrow_back_ios_new_outlined;

    Widget imageWidget = ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isEven ? 24 : 0),
        bottomLeft: Radius.circular(isEven ? 24 : 0),
        topRight: Radius.circular(isEven ? 0 : 24),
        bottomRight: Radius.circular(isEven ? 0 : 24),
      ),
      child: Image.asset(category.image ?? "", height: 200, fit: BoxFit.cover),
    );

    Widget buildButton() {
      final rowChildren = isEven
          ? [
              const SizedBox(width: 8),
              Text(
                "View All",
                style: context.fonts.titleLarge?.copyWith(
                  color: buttonTextColor,
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: iconBgColor,
                child: Icon(icon, color: buttonTextColor),
              ),
            ]
          : [
              CircleAvatar(
                radius: 25,
                backgroundColor: iconBgColor,
                child: Icon(icon, color: buttonTextColor),
              ),
              Text(
                "View All",
                style: context.fonts.titleLarge?.copyWith(
                  color: buttonTextColor,
                ),
              ),
              const SizedBox(width: 8),
            ];
      return Container(
        width: 167,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(84),
          color: buttonBgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ),
      );
    }

    Widget infoWidget = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            category.catName ?? "",
            style: context.fonts.titleLarge?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          buildButton(),
        ],
      ),
    );

    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: cardBgColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isEven
            ? [imageWidget, infoWidget]
            : [infoWidget, imageWidget],
      ),
    );
  }
}
