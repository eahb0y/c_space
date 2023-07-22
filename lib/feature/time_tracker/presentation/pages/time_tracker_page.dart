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
        title: Text('Time tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.person, size: 100,),
                      Text('Employee'),
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.person, size: 100,),
                    Text('Client'),
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
