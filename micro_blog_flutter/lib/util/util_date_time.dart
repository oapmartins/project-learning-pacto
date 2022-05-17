import 'package:intl/intl.dart';

class UtilDateTime {
  static DateTime convertStringToDate(String date) {
    try {
      return DateFormat('yyyy-MM-dd hh:mm:ss', 'en_US').parse(date);
    } catch (e) {
      return null;
    }
  }
}
