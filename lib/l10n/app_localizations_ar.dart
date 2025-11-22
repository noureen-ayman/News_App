// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get viewFullArticle => 'عرض المقال كاملاً';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get newsApp => 'تطبيق الأخبار';

  @override
  String get home => 'الرئيسية';

  @override
  String get goToHome => 'اذهب الى الصفحه الرئيسيه';

  @override
  String get dark => 'داكن';

  @override
  String get light => 'فاتح';

  @override
  String get language => 'اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get goodMorningHereIsSomeNewsForYou =>
      'صباح الخير إليك بعض الأخبار لك ';

  @override
  String get couldNotOpenArticleUrlMissing =>
      'لا يمكن فتح المقال، الرابط غير موجود.';

  @override
  String get couldNotLaunchUrl => 'لا يمكن فتح الرابط';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get noDescription => 'لا يوجد وصف';
}
