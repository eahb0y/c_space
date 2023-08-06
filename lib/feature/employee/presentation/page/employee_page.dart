import 'package:c_space/feature/employee/presentation/bloc/employee_get_time_bloc/employee_get_time_bloc.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
          body: Center(
            child: Lottie.network('https://asset-cdn.lottiefiles'),
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
