import 'package:c_space/feature/history/presentation/arguments/history_list_arguments.dart';
import 'package:flutter/material.dart';

class HistoryListWidget extends StatelessWidget {
  final HistoryListArguments? listArguments;

  const HistoryListWidget({super.key, required this.listArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listArguments?.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Дата'),
                    SizedBox(),
                    Text('Пришел'),
                    SizedBox(),
                    Text('Ушел'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(listArguments?.date ?? ''),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(listArguments?.checkIn ?? ''),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(listArguments?.checkOut ?? ''),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
