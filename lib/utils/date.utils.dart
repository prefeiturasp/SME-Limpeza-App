import 'package:intl/intl.dart';

class DateUtils {
  
  static const FORMAT_BR_DATE = "dd/MM/yyyy";

  static DateTime stringToDateTime(String dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    
    try {
      return DateTime.parse(dateTimeString);
    } catch (e) {
      return _dateStringToDateTime(datetimeString: dateTimeString);
    }
  }

  static String dateTimeToString(DateTime dateTime) => dateTime == null ? null : dateTime.toIso8601String();

  static dateToFormat({DateTime datetime, String format = FORMAT_BR_DATE}) {
    datetime = datetime == null ? DateTime.now() : datetime;
    return DateFormat(format).format(datetime);
  }

   static _dateStringToDateTime({String datetimeString, bool newOnNull: false}) {
    if (datetimeString == null) {
      return newOnNull ? DateTime.now() : null;
    }
    return DateFormat().parse(datetimeString);
  }

}