import 'package:c_space/feature/problems/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/issue_list_widget.dart';
import 'widgets/modal_botton_sheet.dart';

class IssueWidget extends StatefulWidget {
  const IssueWidget({super.key});

  @override
  State<IssueWidget> createState() => _IssueWidgetState();
}

class _IssueWidgetState extends State<IssueWidget> {
  @override
  void initState() {
    context.read<IssueGetBloc>().add(IssueGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueGetBloc, IssueGetState>(
      builder: (context, state) {
        return Scaffold(
          body: (state.issueModal?.length ?? 0) > 0
              ? IssueListWidget(
            issueModal: state.issueModal,
          )
              : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple,
                color: Colors.purple.shade100,
              )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.purple,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    )),
                builder: (context) {
                  return ModalBottomSheet();
                },
              ).then(
                      (value) =>
                      context.read<IssueGetBloc>().add(IssueGetEvent()));
            },
          ),
        );
      },
    );

  }
  @override
  void dispose() {
    super.dispose();
  }
}
