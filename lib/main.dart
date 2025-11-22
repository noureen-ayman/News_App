import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'AppCore/AppRoutes/AppRoutes.dart';
import 'AppCore/AppTheme/AppTheme.dart';
import 'AppCore/app_shared_preferences.dart';
import 'AppCore/providers/LanguageProvider.dart';
import 'AppCore/providers/ThemeProvider.dart';
import 'Presentation/HomeScreen/HomeScreen.dart';
import 'Presentation/SearchScreen/SearchView.dart';
import 'Presentation/SplashScreen/splashScreen.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await AppSharedPreferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.getSelectedThemeMode(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.getSelectedLocale(),
      debugShowCheckedModeBanner: false,

      routes: {
        AppRoutes.homeRoute: (_) => HomeScreen(),
        AppRoutes.searchRoute: (_) => SearchView(),
        AppRoutes.splashRoute: (_) => SplashScreen(),
      },
      initialRoute: AppRoutes.splashRoute,
    );
  }
}
