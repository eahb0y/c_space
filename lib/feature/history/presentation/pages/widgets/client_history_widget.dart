import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/history/presentation/arguments/history_list_arguments.dart';
import 'package:c_space/feature/history/presentation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHistoryWidget extends StatefulWidget {
  const ClientHistoryWidget({super.key});

  @override
  State<ClientHistoryWidget> createState() => _ClientHistoryWidgetState();
}

class _ClientHistoryWidgetState extends State<ClientHistoryWidget> {
  late String name;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        sl<LocalClientSource>().box.getAt(index),
                      ),
                      onTap: () {
                        setState(() {
                          name = sl<LocalClientSource>().box.getAt(index);
                        });
                        context
                            .read<ClientBloc>()
                            .add(ClientGetTime(name: name));
                        Navigator.pushNamed(
                          rootNavigatorKey.currentContext!,
                          RoutName.historyList,
                          arguments: HistoryListArguments(
                            date: state.clientData[index].date,
                            checkIn: state.clientData[index].checkIn,
                            checkOut: state.clientData[index].checkOut,
                            name: state.clientData[index].name,
                          ),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(
                      height: 5,
                    ),
                itemCount: sl<LocalClientSource>().box.length),
          ),
        );
      },
    );
  }
}
