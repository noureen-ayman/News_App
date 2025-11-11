import 'package:flutter/material.dart';
import 'package:news/AppCore/extentions/context_extentions.dart';
import 'package:provider/provider.dart';

import '../../AppCore/providers/ThemeProvider.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
    this.onHomeClick, {
    super.key,
    this.title,
    this.actions,
    required this.body,
  });

  final String? title;

  final Widget body;
  final Widget? actions;
  final VoidCallback onHomeClick;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(title!),
        centerTitle: true,
        actions: actions != null ? [actions!] : null,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text("News App", style: context.fonts.titleLarge),
              ),
            ),
            ListTile(
              onTap: () {
                onHomeClick();
                Navigator.pop(context);
              },
              title: Text("Go To Home"),
              leading: Icon(Icons.home_outlined),
            ),
            Divider(),
            ListTile(
              onTap: () {
                themeProvider.setTheme = themeProvider.isDark
                    ? ThemeMode.light
                    : ThemeMode.dark;
              },
              title: Text(themeProvider.isDark ? "Dark" : "Light"),
              leading: Icon(
                themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("Language"),
              leading: Icon(Icons.language_outlined),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
