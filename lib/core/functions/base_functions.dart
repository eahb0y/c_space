import 'package:intl/intl.dart';

class BaseFunctions{
  static String moneyFormat(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result =
        NumberFormat("#,##0", "ru_RU").format(number).split(",").join(splitter);
    return isNegative
        ? "-$result sum"
        : "$result sum";
  }
}