import 'package:flutter/material.dart';
import 'package:news/data/CategoryCardModel/CategoryCardModel.dart';

import '../../AppCore/AppRoutes/AppRoutes.dart';
import '../CategoryScreen/CategoryScreen.dart';
import '../NewsScreen/NewsScreen.dart';
import '../commonWidgets/CustomScaffold.dart';

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
      actions: category == null
          ? null
          : IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.searchRoute);
        },
        icon: Icon(Icons.search_outlined, size: 30,),
      ),
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
