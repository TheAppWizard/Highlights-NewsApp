import 'package:intl/intl.dart';

String convertToRegularDateFormat(String dateInput) {
  DateTime dateTime = DateTime.parse(dateInput);
  return DateFormat("yyyy-MM-dd HH:mm EEEE").format(dateTime);
}


///Test Drive
String getDay(String dateInput) {
  DateTime dateTime = DateTime.parse(dateInput);
  return DateFormat("EEEE").format(dateTime);
}
