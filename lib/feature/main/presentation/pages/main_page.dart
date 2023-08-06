import 'package:c_space/feature/client/presintation/bloc/client_get_time_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/client_set_time_bloc/client_set_time_bloc.dart';
import 'package:c_space/feature/issue/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:c_space/feature/main/presentation/bloc/main_bloc.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key, this.initialRoute});

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MainBloc>()),
        BlocProvider(create: (_) => sl<ClientSetTimeBloc>()),
        BlocProvider(create: (_) => sl<ClientGetTimeBloc>()),
        // BlocProvider(create: (_) => sl<EmployeeSetTimeBloc>()),
        // BlocProvider(create: (_) => sl<EmployeeGetTimeBloc>()),
        BlocProvider(create: (_) => sl<IssueGetBloc>())
      ],
      child: MainBody(
        initialRoute: initialRoute,
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  final String? initialRoute;

  const MainBody({super.key, this.initialRoute});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: Navigator(
            key: shellRootNavigatorKey,
            initialRoute: widget.initialRoute,
            onGenerateRoute: Rout.onShellGenerateRoute,
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.zero,
            child: BottomNavigationBar(
              backgroundColor: Colors.purple.shade500,
              currentIndex: state.tab.index,
              onTap: (index) => changeTap(context, index),
              items: [
                _buildMenuItem(
                  icon: Icon(Icons.access_time,
                      color: Colors.white),
                  activeIcon: Icon(
                    Icons.access_time_filled,
                    color: Colors.white,
                  ),
                ),
                _buildMenuItem(
                  icon: Icon(Icons.edit_calendar_outlined, color: Colors.white),
                  activeIcon: Icon(
                    Icons.calendar_month_sharp ,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildMenuItem({
    required Icon icon,
    required Icon activeIcon,
  }) {
    return BottomNavigationBarItem(
        icon: icon, activeIcon: activeIcon, label: "");
  }

  void changeTap(BuildContext context, int index) {
    context.read<MainBloc>().add(MainTabChange(MainTab.values[index]));
    switch (index) {
       case 0:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          RoutName.timeTracker,
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          RoutName.issue,
          (route) => false,
        );
        break;
    }
  }
}
