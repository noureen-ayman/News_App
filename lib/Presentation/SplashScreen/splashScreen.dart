import 'package:flutter/material.dart';
import 'package:news/AppCore/AppImages/AppImages.dart';
import 'package:news/AppCore/AppRoutes/AppRoutes.dart';
import 'package:provider/provider.dart';

import '../../AppCore/providers/ThemeProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;
    final backgroundColor = isDark ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              isDark ? AppImages.spalshImageDark : AppImages.spalshImageLight,
              width: 150,
              height: 150,
            ),
            const Spacer(),
            Image.asset(
              isDark ? AppImages.routeLogoDark : AppImages.routeLogoLight,
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
