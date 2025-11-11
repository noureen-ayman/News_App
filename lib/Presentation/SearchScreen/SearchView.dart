import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppCore/AppColors/AppColors.dart';
import '../../AppCore/AppRoutes/AppRoutes.dart';
import '../../AppCore/providers/ThemeProvider.dart';
import '../../View_Models/Search_viewModel.dart';
import 'SearchScreen.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel viewModel = SearchViewModel();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;
    final borderColor = isDark ? AppColors.white : AppColors.grey;

    return ChangeNotifierProvider<SearchViewModel>.value(
      value: viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: "Search",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _searchController.clear();
                            viewModel.resetState();
                          },
                          icon: Icon(Icons.clear),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.homeRoute,
                            );
                          },
                          icon: Icon(Icons.exit_to_app_outlined),
                        ),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: borderColor, width: 2),
                    ),
                  ),
                  onSubmitted: (value) => viewModel.getArticlesBySearch(value),
                ),
              ),
              Expanded(child: SearchScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
