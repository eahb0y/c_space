import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/feature/client/presintation/pages/client_screen.dart';
import 'package:flutter/material.dart';

class ClientScreenWidget extends StatelessWidget {
  const ClientScreenWidget({
    super.key,
    required this.data,
    required this.location,
  });

  final List<ClientModel> data;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // title: Text(client.toString()),
            backgroundColor: Colors.purple,
            actions: [Icon(Icons.person)],
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('6000'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text('Check in'),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('Chech out'),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  title: Center(
                                    child: Text(data[index].checkIn),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  title: Center(
                                    child: Text(data[index].checkOut),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        print(location);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClientScreen(
                              locationName: location,
                            ),
                          ),
                        );
                      },
                      child: const Text('Check')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
