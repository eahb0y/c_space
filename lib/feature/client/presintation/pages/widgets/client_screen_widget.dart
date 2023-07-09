import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:flutter/material.dart';

class ClientScreenWidget extends StatelessWidget {
  const ClientScreenWidget({
    super.key,
    required this.data,
    required this.location,
  });

  final List<ClientModel>? data;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: data!.length,
      itemBuilder: (_, index) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Center(
                      child: Text(data![index].checkIn),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Center(
                      child: Text(data![index].checkIn),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
