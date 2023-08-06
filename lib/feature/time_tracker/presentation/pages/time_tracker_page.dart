import 'package:c_space/feature/employee/presentation/bloc/employee_get_time_bloc/employee_get_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/bloc/employee_set_time_bloc/employee_set_time_bloc.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTrackerPage extends StatefulWidget {
  const TimeTrackerPage({super.key});

  @override
  State<TimeTrackerPage> createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Трекер времени'),
          backgroundColor: Colors.purple.shade400,
          toolbarHeight: 70,
          actions: [
            IconButton(onPressed: (
                ) {
              Navigator.pushNamed(rootNavigatorKey.currentContext!, RoutName.history );
            }, icon: Icon(Icons.history_outlined)),
            SizedBox(
              width: 7,
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => sl<EmployeeSetTimeBloc>()),
                BlocProvider(create: (_) => sl<EmployeeGetTimeBloc>()),
              ],
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  Navigator.pushNamed(
                    rootNavigatorKey.currentContext!,
                    RoutName.employeeQr,
                  );
                },
                child: Ink(
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade500,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.work,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        'Работник',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                Navigator.pushNamed(
                  rootNavigatorKey.currentContext!,
                  RoutName.clientQr,
                );
              },
              child: Ink(
                padding: EdgeInsets.all(10),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.purple.shade500,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      'Клиент',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
