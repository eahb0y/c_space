import 'package:c_space/feature/client/presintation/bloc/client_set_time_bloc/client_set_time_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/argument/client_argument_info.dart';
import 'package:c_space/feature/client/presintation/pages/client_screen.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_info_screen.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_qr.dart';
import 'package:c_space/feature/employee/presentation/bloc/employee_set_time_bloc/employee_set_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/page/employee_page.dart';
import 'package:c_space/feature/employee/presentation/page/widget/employee_qr.dart';
import 'package:c_space/feature/login/bloc/login_page_bloc.dart';
import 'package:c_space/feature/login/page/main_screen_widget.dart';
import 'package:c_space/feature/main/presentation/pages/main_page.dart';
import 'package:c_space/feature/splash/presentation/pages/splash_page.dart';
import 'package:c_space/feature/time_tracker/presentation/pages/time_tracker_page.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

class Rout {
  Rout._();

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.initial:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RoutName.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (_) => sl<LoginPageBloc>(),
                  child: LoginPage(),
                ));
      case RoutName.main:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => sl<LoginPageBloc>(),
            child: MainPage(
              initialRoute: settings.arguments is String
                  ? settings.arguments as String
                  : null,
            ),
          ),
        );
      case RoutName.clientQr:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<ClientSetTimeBloc>(),
            child: ClientQr(),
          ),
        );
      case RoutName.employeeQr:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => EmployeeSetTimeBloc(),
            child: EmployeeQr(),
          ),
        );
      case RoutName.client:
        return MaterialPageRoute(builder: (context) => ClientScreen());
      case RoutName.clientInfo:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => TimeBloc(),
                  child: ClientInfoScreen(
                      argument: settings.arguments is ClientInfoArgument
                          ? settings.arguments as ClientInfoArgument
                          : null),
                ));
      case RoutName.employee:
        return MaterialPageRoute(builder: (context) => EmployeePage(
          name: settings.arguments is String
              ? settings.arguments as String
              : '',
        ));
      default:
        throw ('The rout does not exist');
    }
  }

  static Route<dynamic> onShellGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("route : ${settings.name}");
    }
    switch (settings.name) {
      case RoutName.initial:
        return MaterialPageRoute(builder: (_) => const TimeTrackerPage());
      case RoutName.timeTracker:
        return buildPageWithDefaultTransition(child: TimeTrackerPage());
      case RoutName.client:
        return buildPageWithDefaultTransition(child: ClientScreen());
      default:
        return MaterialPageRoute(builder: (_) => const TimeTrackerPage());
    }
  }
}

PageRouteBuilder buildPageWithDefaultTransition<T>({required Widget child}) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
