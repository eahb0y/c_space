import 'package:c_space/constants.dart';
import 'package:c_space/feature/problems/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalButtonSheetUpdate extends StatefulWidget {
  final String id;
  final String issue;

  ModalButtonSheetUpdate({super.key, required this.id, required this.issue});

  @override
  State<ModalButtonSheetUpdate> createState() => _ModalButtonSheetUpdateState();
}

class _ModalButtonSheetUpdateState extends State<ModalButtonSheetUpdate> {
  DateTime dataTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TextEditingController controller = TextEditingController();
  bool isEmpty = false;
  String currentState = Constants.status[0];

  @override
  void initState() {
    super.initState();
    controller.text = widget.issue;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Write some issue..',
              border: OutlineInputBorder(),
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
              buildRadio(color: Colors.red, value: Constants.status[0]),
              buildRadio(color: Colors.yellow, value: Constants.status[1]),
              buildRadio(color: Colors.green, value: Constants.status[2]),
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
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    );
                  },
                  child:
                      Text('${dataTime.year}-${dataTime.month}-${dataTime.day}',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                ),
              ],
            ),
          ),
          BlocBuilder<IssueGetBloc, IssueGetState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 45),
                    backgroundColor: isEmpty ? Colors.red : Colors.purple),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    Navigator.pop(context);
                    context.read<IssueGetBloc>().add(
                          IssueUpdateEvent(
                            status: currentState,
                            issue: controller.text,
                            deadline:
                                '${dataTime.year}-${dataTime.month}-${dataTime.day}',
                            id: widget.id,
                          ),
                        );
                  } else {
                    setState(() {
                      isEmpty = true;
                    });
                  }
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

  Radio<String> buildRadio({required String value, required Color color}) {
    return Radio(
      value: value,
      groupValue: currentState,
      onChanged: (value) {
        setState(() {
          currentState = value.toString();
        });
      },
      fillColor: MaterialStateColor.resolveWith(
        (states) => color,
      ),
    );
  }
}
