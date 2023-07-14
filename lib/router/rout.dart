import 'package:c_space/core/qr_scan/qrscan.dart';
import 'package:c_space/core/qr_scan/qrscan_argument.dart';
import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/feature/client/presintation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/argument/client_argument.dart';
import 'package:c_space/feature/client/presintation/pages/client_screen.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_info_screen.dart';
import 'package:c_space/feature/main_page/bloc/main_page_bloc.dart';
import 'package:c_space/feature/main_page/page/main_screen_widget.dart';
import 'package:c_space/feature/splash/presentation/pages/splash_page.dart';
import 'package:c_space/injection_container.dart';
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
                  create: (_) => sl<WelcomeScreenBloc>(),
                  child: MainScreenWidget(),
                ));
      case RoutName.qrPage:
        return MaterialPageRoute(
          builder: (context) => QRSan(
            argument: settings.arguments is QrScanArgument
                ? settings.arguments as QrScanArgument
                : null,
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
      case RoutName.clientInfo:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => TimeBloc(),
                  child: ClientInfoScreen(
                      clientData: settings.arguments is List<ClientModel>
                          ? settings.arguments as List<ClientModel>
                          : null),
                ));
      default:
        throw ('The rout does not exist');
    }
  }
}
