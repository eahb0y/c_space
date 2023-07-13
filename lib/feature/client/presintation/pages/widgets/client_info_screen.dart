import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientInfoScreen extends StatefulWidget {
  final List<ClientModel>? clientData;
  const ClientInfoScreen({super.key, required this.clientData});

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TimeBloc>().add(GetTotalTime(
        clientDate: widget.clientData ?? []));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Ink(
                  child: Text(state.clientTotalTime ?? '150'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}