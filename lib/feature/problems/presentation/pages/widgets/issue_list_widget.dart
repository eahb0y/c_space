import 'package:c_space/feature/problems/data/model/issue_get_time_model.dart';
import 'package:c_space/feature/problems/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modal_botton_sheet.dart';
import 'modal_button_sheet_update.dart';

class IssueListWidget extends StatelessWidget {
  final List<IssueGetTimeModel>? issueModal;

  const IssueListWidget({super.key, required this.issueModal});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueGetBloc, IssueGetState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(8.0),
            itemBuilder: (_, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Ink(
                  padding: EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 35,
                      ),
                    ],
                  ),
                ),
                secondaryBackground: Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.only(right: 35),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 35,
                      ),
                    ],
                  ),
                ),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    context
                        .read<IssueGetBloc>()
                        .add(IssueDeleteEvent(id: issueModal![index].id));
                    context.read<IssueGetBloc>().add(IssueGetEvent());
                  } else {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => ModalBottomSheet(
                              id: issueModal![index].id,
                              issue: issueModal![index].issue,
                          status: issueModal![index].status,
                            )).then((value) =>
                        context.read<IssueGetBloc>().add(IssueGetEvent()));
                  }
                },
                child: Material(
                  child: Ink(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.purple.shade100,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ExpansionTile(
                        title: Row(
                          children: [
                            Ink(
                              width: 30,
                              height: 30,
                              decoration: new BoxDecoration(
                                color: issueModal?[index].status == 'red'
                                    ? Colors.red
                                    : issueModal?[index].status == 'yellow'
                                        ? Colors.yellow
                                        : Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(issueModal![index].issue),
                          ],
                        ),
                        children: [
                          SizedBox(
                            height: 100,
                            child: ListTile(
                              title: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Локация: ${issueModal![index].location}'),
                                  Text('День: ${issueModal![index].date}'),
                                  Text(
                                      'Конечный срок: ${issueModal![index].deadline}'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
              );
            },
            itemCount: issueModal?.length ?? 0);
      },
    );
  }
}
