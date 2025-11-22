// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get viewFullArticle => 'View Full Article';

  @override
  String get viewAll => 'View All';

  @override
  String get newsApp => 'News App';

  @override
  String get home => 'Home';

  @override
  String get goToHome => 'Go To Home';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get goodMorningHereIsSomeNewsForYou =>
      'Good Morning\nHere is Some News For You';

  @override
  String get couldNotOpenArticleUrlMissing =>
      'Could not open article, URL is missing.';

  @override
  String get couldNotLaunchUrl => 'Could not launch URL';

  @override
  String get somethingWentWrong => 'Something Went Wrong';

  @override
  String get noDescription => 'No Description';
}
