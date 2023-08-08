import 'package:c_space/feature/issue/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:c_space/feature/issue/presentation/pages/widgets/issue_list_widget.dart';
import 'package:c_space/feature/issue/presentation/pages/widgets/modal_botton_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuePage extends StatefulWidget {
  IssuePage({super.key});

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  @override
  void initState() {
    super.initState();
    context.read<IssueGetBloc>().add(IssueGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueGetBloc, IssueGetState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text('Issue list'),
          ),
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
                  (value) => context.read<IssueGetBloc>().add(IssueGetEvent()));
            },
          ),
        );
      },
    );
  }
}
