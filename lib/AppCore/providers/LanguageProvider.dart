import 'package:flutter/material.dart';

import '../app_shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  AppSharedPreferences appSettingsPreferences =
      AppSharedPreferences.getInstance();

  Locale _local = const Locale("en");

  LanguageProvider() {
    _loadCurrentLocale();
  }

  void _loadCurrentLocale() async {
    Locale? savedLocal = await appSettingsPreferences.getCurrentLocale();
    if (savedLocal != null) _local = savedLocal;
    notifyListeners();
  }

  List<Locale> getSupportedLocales() {
    return const [Locale('en'), Locale('ar')];
  }

  Locale getSelectedLocale() {
    return _local;
  }

  void changeLocale(Locale newLang) async {
    if (_local.languageCode == newLang.languageCode) return;

    _local = newLang;
    await appSettingsPreferences.saveLocale(_local);
    notifyListeners();
  }
}
