import 'dart:ui';

import 'package:c_space/core/qr_scan/qrscan.dart';
import 'package:c_space/feature/client/presintation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_info_screen.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientScreen extends StatefulWidget {
  final String locationName;
  final String name;

  const ClientScreen({
    super.key,
    required this.locationName,
    required this.name,
  });

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClientBloc>(context).add(GetAndSetClientTime(
        name: widget.name, locationName: widget.locationName));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(widget.name,
                  style:  TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                  ),),
                ),
                backgroundColor: Colors.purple,
                actions: [Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClientInfoScreen(clientData: state.clientData,)),
                    );
                  }, icon: Icon(Icons.person, size: 30,)),
                )],
                expandedHeight: 150,
                pinned: true,
                // flexibleSpace: FlexibleSpaceBar(
                //   title: Text('6000'),
                // ),
              ),
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 5,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(-40),
                  child: SizedBox(),
                ),
                flexibleSpace: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Пришел',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Ушел',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClientScreenWidget(
                location: widget.locationName,
                data: state.clientData,
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 45),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRSan(
                        locationName: widget.locationName,
                      ),
                    ),
                  );
                },
                child: const Text('Регистрировать')),
          ),
        );
      },
    );
  }
}