import 'package:c_space/constants.dart';
import 'package:c_space/feature/issue/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalBottomSheet extends StatefulWidget {
  ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  DateTime dataTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TextEditingController controller = TextEditingController();
  String currentState = Constants.status[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Write some issue..',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text('Select status',
              style: TextStyle(
                fontSize: 18,
              )),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Radio(
                value: Constants.status[0],
                groupValue: currentState,
                onChanged: (value) {
                  setState(() {
                    currentState = value.toString();
                  });
                  print(currentState);
                },
                fillColor: MaterialStateColor.resolveWith(
                  (states) => Colors.red,
                ),
              ),
              Radio(
                value: Constants.status[1],
                groupValue: currentState,
                onChanged: (value) {
                  setState(() {
                    currentState = value.toString();
                  });
                  print(currentState);
                },
                fillColor: MaterialStateColor.resolveWith(
                  (states) => Colors.yellow,
                ),
              ),
              Radio(
                value: Constants.status[2],
                groupValue: currentState,
                onChanged: (value) {
                  setState(() {
                    currentState = value.toString();
                  });
                  print(currentState);
                },
                fillColor: MaterialStateColor.resolveWith(
                  (states) => Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Center(
                    child: Text(
                  'Deadline: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                        height: 250,
                        child: CupertinoDatePicker(
                          initialDateTime: dataTime,
                          onDateTimeChanged: (DateTime newDateTime) {
                            setState(() {
                              dataTime = newDateTime;
                            });
                            print(dataTime);
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    );
                  },
                  child: Text(
                      '${dataTime.year}-${dataTime.month}-${dataTime.day}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
          BlocBuilder<IssueGetBloc, IssueGetState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 45), backgroundColor: Colors.purple),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<IssueGetBloc>().add(IssueAddEvent(
                        status: currentState,
                        issue: controller.text,
                        deadline: '${dataTime.year}-${dataTime.month}-${dataTime.day}',
                      ));
                  // context.read<IssueGetBloc>().add(PushNotification(
                  //   status: currentState,
                  //   issue: controller.text,
                  // ));
                },
                child: Text(
                  'Add issue',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
