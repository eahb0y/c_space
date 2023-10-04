import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/history/presentation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ClientHistoryWidget extends StatefulWidget {
  const ClientHistoryWidget({super.key});

  @override
  State<ClientHistoryWidget> createState() => _ClientHistoryWidgetState();
}

class _ClientHistoryWidgetState extends State<ClientHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: sl<LocalClientSource>().box.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: Lottie.asset(
                          'assets/animation/empty_animation.json',
                          repeat: false,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Нету клиентов',
                        style: TextStyle(fontSize: 26),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      String name = sl<LocalClientSource>().box.getAt(index);
                      return Dismissible(
                        key: ValueKey<int>(
                            sl<LocalClientSource>().box.getAt(index)),
                        background: Ink(
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(
                              name,
                            ),
                            onTap: () {
                              context
                                  .read<ClientBloc>()
                                  .add(ClientGetTime(name: name));

                              context.read<ClientBloc>().add(
                                    ClientTotalTime(
                                      clientDate: state.clientData,
                                    ),
                                  );
                            },
                          ),
                        ),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            sl<LocalClientSource>().deleteClient(name);
                          });
                        },
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(
                      height: 5,
                    ),
                    itemCount: sl<LocalClientSource>().box.length,
                  ),
                ),
        );
      },
    );
  }
}
