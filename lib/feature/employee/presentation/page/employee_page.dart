import 'package:c_space/feature/employee/presentation/bloc/employee_get_time_bloc/employee_get_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/page/widget/employee_screen_widget.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeePage extends StatefulWidget {
  final String name;

  const EmployeePage({
    super.key,
    required this.name,
  });

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeGetTimeBloc>().add(
      EmployeeGetTime(
        name: widget.name,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeGetTimeBloc, EmployeeGetTimeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 150,
                pinned: true,
                backgroundColor: Colors.purple,
                title: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    state.employeeName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              EmployeeScreenWidget(
                checkIn: state.checkIn,
                checkOut: state.checkOut ?? '12',
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 45), backgroundColor: Colors.purple),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  rootNavigatorKey.currentContext!,
                  RoutName.employeeQr,
                );
              },
              child: const Text('Регистрировать'),
            ),
          ),
        );
      },
    );
  }
}
