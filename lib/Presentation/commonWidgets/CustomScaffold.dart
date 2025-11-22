import 'package:flutter/material.dart';
import 'package:news/AppCore/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

import '../../AppCore/providers/LanguageProvider.dart';
import '../../AppCore/providers/ThemeProvider.dart';
import '../../l10n/app_localizations.dart';

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
    final languageProvider = Provider.of<LanguageProvider>(context);
    final l10n = AppLocalizations.of(context)!;

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
                child: Text(l10n.newsApp, style: context.fonts.titleLarge),
              ),
            ),
            ListTile(
              onTap: () {
                onHomeClick();
                Navigator.pop(context);
              },
              title: Text(l10n.goToHome),
              leading: Icon(Icons.home_outlined),
            ),
            Divider(),
            ListTile(
              onTap: () {
                ThemeMode newMode = themeProvider.isDark
                    ? ThemeMode.light
                    : ThemeMode.dark;
                themeProvider.changeTheme(newMode);
              },
              title: Text(themeProvider.isDark ? l10n.dark : l10n.light),
              leading: Icon(
                themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Locale newLocale =
                    languageProvider.getSelectedLocale().languageCode == 'ar'
                    ? const Locale('en')
                    : const Locale('ar');
                languageProvider.changeLocale(newLocale);
              },
              title: Text(
                languageProvider.getSelectedLocale().languageCode == 'ar'
                    ? l10n.arabic
                    : l10n.english,
              ),
              leading: Icon(Icons.language_outlined),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
