import 'package:c_space/core/qr_scan/qrscan.dart';
import 'package:c_space/feature/client/presintation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/argument/client_argument.dart';
import 'package:c_space/feature/client/presintation/pages/client_screen.dart';
import 'package:c_space/feature/main_page/bloc/main_page_bloc.dart';
import 'package:c_space/feature/main_page/page/main_screen.dart';
import 'package:c_space/feature/splash/presentation/pages/splash_page.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rout {
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.initial:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RoutName.mainPage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => WelcomeScreenBloc(),
                  child: MainScreen(),
                ));
      case RoutName.qrPage:
        return MaterialPageRoute(
          builder: (context) => QRSan(
            locationName: settings.arguments is String
                ? settings.arguments as String
                : '',
          ),
        );
      case RoutName.clientPage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ClientBloc(),
                  child: ClientScreen(
                      argument: settings.arguments is ClientArgument
                          ? settings.arguments as ClientArgument
                          : null),
                ));
      default:
        throw ('The rout does not exist');
    }
  }
}
