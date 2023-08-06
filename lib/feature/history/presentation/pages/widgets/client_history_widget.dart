import 'package:c_space/feature/history/presentation/bloc/client_bloc/client_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHistoryWidget extends StatelessWidget {

  const ClientHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.separated(
            itemBuilder: (_, index)
            {return state.clientData.isNotEmpty ? CircularProgressIndicator() : Card(
              child: ListTile(
                title: Text(state.clientData[index].name),
              ),
            );},
            separatorBuilder: (_, __) => SizedBox(height: 8,),
            itemCount:
            state.clientData.length
          ),
        );
      },
    );
  }
}
