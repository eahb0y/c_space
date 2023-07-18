import 'package:c_space/feature/employee/presentation/page/widget/employee_screen_widget.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Работник ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          EmployeeScreenWidget()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 45), backgroundColor: Colors.purple),
          onPressed: () {
            // Navigator.pushNamed(
            //   rootNavigatorKey.currentContext!,
            //   RoutName.qr,
            // );
          },
          child: const Text('Регистрировать'),
        ),
      ),
    );
  }
}
