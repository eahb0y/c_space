import 'package:intl/intl.dart';

String currentDay = DateFormat('dd-MM-yyyy').format(DateTime.now());
String currentTime = DateFormat('HH:mm').format(DateTime.now());


class AppKeys{
  static const hasLocation = 'hasLocation';
}