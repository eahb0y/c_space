import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/argument/client_argument_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientInfoScreen extends StatefulWidget {
  final ClientInfoArgument? argument;

  const ClientInfoScreen({
    super.key,
    required this.argument,
  });

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TimeBloc>().add(
          GetTotalTime(
            clientDate: widget.argument?.clientModel ?? [],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Text(
                      'Клиент: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Ink(
                      child: Center(
                        child: Text(
                          widget.argument?.clientName ?? '',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Осталось: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Ink(
                      child: Text(
                        '${state.clientTotalTime} минут',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
