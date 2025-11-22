import 'package:intl/intl.dart';

extension StringToDateFormatter on String {
  String formateArticlesDate() {
    DateFormat inputFormate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    DateFormat outputFormate = DateFormat("EEE, MMM d, yyyy");
    DateTime date = inputFormate.parse(this);
    return outputFormate.format(date);
  }
}
