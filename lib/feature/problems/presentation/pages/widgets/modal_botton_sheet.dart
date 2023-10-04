import 'package:c_space/constants.dart';
import 'package:c_space/feature/problems/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:c_space/router/rout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalBottomSheet extends StatefulWidget {
  final String? id;
  final String? issue;
  final String? status;
  ModalBottomSheet({super.key, this.id, this.issue, this.status});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  DateTime dataTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TextEditingController controller = TextEditingController();
  late String currentState;
  bool isEmpty = false;

  @override
  void initState() {
    if(widget.issue?.isNotEmpty ?? false){
      controller.text = widget.issue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.status == 'red'){
      currentState = Constants.status[0];
    }
    else if(widget.status == 'yellow'){
      currentState = Constants.status[1];
    }
    else if(widget.status == 'green'){
      currentState = Constants.status[1];
    }
    else{
      currentState = Constants.status[0];
    }
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Write some issue..',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 8,
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
              buildRadio(value: Constants.status[0], color: Colors.red),
              buildRadio(value: Constants.status[1], color: Colors.yellow),
              buildRadio(value: Constants.status[2], color: Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Deadline: ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: rootNavigatorKey.currentContext!,
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
          SizedBox(
            height: 8,
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
                    context.read<IssueGetBloc>().add(IssueAddEvent(
                          status: currentState,
                          issue: controller.text,
                          deadline:
                              '${dataTime.year}-${dataTime.month}-${dataTime.day}',
                        ));
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
