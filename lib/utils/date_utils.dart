import 'package:intl/intl.dart';

class DateUtils {
  static DateTime parseDate(String dateString) {
    DateFormat format = DateFormat("E, dd MMM yyyy", "en_US");
    return format.parse(dateString);
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}