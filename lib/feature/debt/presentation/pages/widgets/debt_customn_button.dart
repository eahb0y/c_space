import 'package:c_space/feature/debt/data/model/debt_get_model.dart';
import 'package:c_space/feature/debt/presentation/bloc/debt_add_bloc/debt_add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebtCustomButton extends StatefulWidget {
  final DebtGetModel debtModel;

  const DebtCustomButton({super.key, required this.debtModel});

  @override
  State<DebtCustomButton> createState() => _DebtCustomButtonState();
}

class _DebtCustomButtonState extends State<DebtCustomButton> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DebtAddBloc(),
      child: BlocBuilder<DebtAddBloc, DebtAddState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 45),
                backgroundColor: isEmpty ? Colors.red : Colors.purple),
            onPressed: () {
              if (widget.debtModel.name.isNotEmpty &&
                  widget.debtModel.debtPrice.isNotEmpty) {
                context
                    .read<DebtAddBloc>()
                    .add(AddDebtorEvent(debtModel: widget.debtModel));
                Navigator.pop(context);
              } else {
                setState(() {
                  isEmpty = true;
                });
              }
            },
            child: Text(
              'Добавить должника',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
