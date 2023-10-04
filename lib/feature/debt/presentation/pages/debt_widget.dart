import 'package:c_space/feature/debt/presentation/bloc/debt_get_bloc/debt_get_bloc.dart';
import 'package:c_space/feature/debt/presentation/pages/widgets/debt_list_widget.dart';
import 'package:c_space/feature/debt/presentation/pages/widgets/debt_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  @override
  void initState() {
    context.read<DebtGetBloc>().add(DebtInfoGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DebtGetBloc, DebtGetState>(
      builder: (context, state) {
        return Scaffold(
          body: state.debtModal.isNotEmpty
              ? DebtListWidget(
                  debtModal: state.debtModal,
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.purple,
                    color: Colors.purple.shade100,
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.purple,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                builder: (context) {
                  return DentModalBottomSheet();
                },
              ).then((value) => context.read<DebtGetBloc>().add(DebtInfoGetEvent()));
            },
          ),
        );
      },
    );
  }
}
