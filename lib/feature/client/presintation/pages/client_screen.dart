import 'package:c_space/core/qr_scan/qrscan.dart';
import 'package:c_space/feature/client/presintation/client_bloc/client_bloc.dart';
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
        print(state.clientData);
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(widget.name),
                backgroundColor: Colors.purple,
                actions: [Icon(Icons.person)],
                expandedHeight: 150,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(state.clientTotalTime.toString()),
                ),
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
                        Text('Check in', style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        ),),
                        Text('Check out', style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),
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
                    minimumSize: Size(150, 45), // put the width and height you want, standard ones are 64, 40
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
                child: const Text('Check')),
          ),
        );
      },
    );
  }
}
