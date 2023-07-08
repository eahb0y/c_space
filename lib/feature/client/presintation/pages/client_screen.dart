import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/feature/client/presintation/client_bloc/client_bloc.dart';
import 'package:c_space/router/rout_name/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientScreen extends StatelessWidget {
  final String? locationName;
  const ClientScreen({super.key, required this.locationName});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocBuilder<ClientBloc, ClientState>(
      //   builder: (context, state) {
      //     if (state is ClientSuccessGetTimeState) {
      //       List<ClientModel> data = state.clientData;
      //       Navigator.pushNamed(context, RoutName.clientPage
      //       );
      //     } else if (state is ClientInitialState) {
      //       Navigator.pushNamed(context, RoutName.qrPage
      //       );
      //     } else {
      //       return const Center(
      //         child: Icon(
      //           Icons.error,
      //           size: 250,
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
