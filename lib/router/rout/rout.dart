import 'package:c_space/core/qr_scan/qrscan.dart';
import 'package:c_space/feature/main_page/page/main_screen.dart';
import 'package:c_space/router/rout_name/rout_name.dart';
import 'package:flutter/material.dart';

class Rout {
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.mainPage:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case RoutName.qrPage:
        return MaterialPageRoute(
          builder: (context) => QRSan(
            locationName: settings.arguments is String
                ? settings.arguments as String
                : '',
          ),
        );
        default:
          throw('The rout does not exist');
    }
  }
}
