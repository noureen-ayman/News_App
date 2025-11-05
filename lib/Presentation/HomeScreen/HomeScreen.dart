import 'package:flutter/material.dart';
import 'package:news/data/CategoryCardModel/CategoryCardModel.dart';
import '../CategoryScreen/CategoryScreen.dart';
import '../NewsScreen/NewsScreen.dart';
import '../common/CustomScaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onHomeClick,
      title: category == null ? 'Home' : category?.catName ?? " ",
      body: category == null
          ? CategoryScreen(onCategoryClick)
          : NewsScreen(category: category),
    );
  }

  void onCategoryClick(CategoryModel category) {
    setState(() {
      this.category = category;
    });
  }

  void onHomeClick() {
    setState(() {
      category = null;
    });
  }
}
