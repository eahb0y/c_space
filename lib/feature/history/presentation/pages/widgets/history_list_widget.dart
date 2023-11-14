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
        actions: [
          SizedBox(
            height: 20,
            width: 20,
          ),
          Text('${listArguments?.time ?? ' '}')]
        ,
        backgroundColor: Colors.purple,

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
                    Text('Дата', style: TextStyle(
                      fontSize: 20
                    ),),
                    SizedBox(),
                    Text('Пришел', style: TextStyle(
                        fontSize: 20
                    ),),
                    SizedBox(),
                    Text('Ушел', style: TextStyle(
                        fontSize: 20
                    ),),
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
