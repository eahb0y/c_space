import 'package:c_space/feature/client/presintation/bloc/client_get_time_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_screen_widget.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'argument/client_argument_info.dart';

class ClientScreen extends StatefulWidget {
  final String name;

  const ClientScreen({
    super.key,
    required this.name,
  });

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ClientGetTimeBloc>().add(
      ClientGetTime(
        name: widget.name,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientGetTimeBloc, ClientGetTimeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    state.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
                backgroundColor: Colors.purple,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            rootNavigatorKey.currentContext!,
                            RoutName.clientInfo,
                            arguments: ClientInfoArgument(
                              clientModel: state.clientData,
                              clientName: state.name,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.person,
                          size: 30,
                        )),
                  )
                ],
                expandedHeight: 100,
                pinned: true,
              ),
              SliverAppBar(
                backgroundColor: Colors.purple.shade300,
                elevation: 5,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                    -40,
                  ),
                  child: SizedBox(),
                ),
                flexibleSpace: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Пришел',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Ушел',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClientScreenWidget(
                data: state.clientData,
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 45),
                backgroundColor: Colors.purple
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  rootNavigatorKey.currentContext!,
                  RoutName.clientQr,
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
