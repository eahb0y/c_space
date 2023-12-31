import 'package:intl/intl.dart';

class Constants {
  static String currentDay = DateFormat('yyyy-MM-dd').format(DateTime.now());
  static String currentTime = DateFormat('HH:mm').format(DateTime.now());

  static final String BASE_URL = 'https://fcm.googleapis.com/fcm/send';
  static final String KEY_SERVER =
      'AAAADVUCQDY:APA91bEctHZGAYKvwS3G9v6wSuaG40YxDU_zmp399t9xb77DsSGFAn_cJZKvdCaiNUtbQNo3CNacyxh_1lpJ0eQTLXtiyhiHWnssu-XTD1tp2XUoOz1glvczhvJzdXvpo1ECdzWtoRKV';
  static final String SENDER_ID = '57260785718';

  static List<String> locationsList = [
    "Maksim Gorkiy",
    "Labzak",
    "Yunusabad",
    "Elbek",
  ];

  static List<String> status = [
    'red',
    'yellow',
    'green',
  ];
  static List<String> month = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  static List<String> tariff = [
    'Flex',
    'Dedicated',
    '1x Office',
    '2x Office',
    '3x Office',
    '4x Office',
    '6x Office',
    '8x Office',
    '10x Office',
    '12x Office',
  ];
}
