import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'AppCore/AppRoutes/AppRoutes.dart';
import 'AppCore/AppTheme/AppTheme.dart';
import 'AppCore/providers/ThemeProvider.dart';
import 'Presentation/HomeScreen/HomeScreen.dart';
import 'Presentation/SearchScreen/SearchView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,

      routes: {
        AppRoutes.homeRoute: (_) => HomeScreen(),
        AppRoutes.searchRoute: (_) => SearchView()
      },
      initialRoute: AppRoutes.homeRoute,
    );
  }
}
