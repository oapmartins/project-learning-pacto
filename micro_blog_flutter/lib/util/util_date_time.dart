import 'package:intl/intl.dart';

class UtilDateTime {
  static DateTime convertStringToDate(String date) {
    return DateFormat().parse(date);
  }
}
