import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/history/presentation/arguments/history_list_arguments.dart';
import 'package:c_space/feature/history/presentation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeHistoryWidget extends StatefulWidget {
  const EmployeeHistoryWidget({super.key});

  @override
  State<EmployeeHistoryWidget> createState() => _EmployeeHistoryWidgetState();
}

class _EmployeeHistoryWidgetState extends State<EmployeeHistoryWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ClientBloc>().add(EmployeeGetTime(name: ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state.employeeData.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                rootNavigatorKey.currentContext!,
                                RoutName.historyList,
                                arguments: HistoryListArguments(
                                    name: state.employeeData[index].name,
                                    date: state.employeeData[index].date,
                                    checkIn: state.employeeData[index].checkIn,
                                    checkOut:
                                        state.employeeData[index].checkOut),
                              );
                            },
                            title: Text(
                              sl<LocalClientSource>().box.getAt(index),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(
                            height: 5,
                          ),
                      itemCount: state.employeeData.length),
                ),
        );
      },
    );
  }
}
