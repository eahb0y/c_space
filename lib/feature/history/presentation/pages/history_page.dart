import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("Работник"),
                onTap: () {
                  Navigator.pushNamed(
                    rootNavigatorKey.currentContext!,
                    RoutName.employeeHistory,
                  );
                },
                trailing: Icon(Icons.chevron_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Клиент"),
                onTap: () {
                  Navigator.pushNamed(
                    rootNavigatorKey.currentContext!,
                    RoutName.clientHistory,
                  );
                },
                trailing: Icon(Icons.chevron_right_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
