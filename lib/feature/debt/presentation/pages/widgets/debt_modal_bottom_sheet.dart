import 'package:c_space/constants.dart';
import 'package:c_space/feature/debt/data/model/debt_get_model.dart';
import 'package:c_space/feature/debt/data/model/debt_list_model.dart';
import 'package:c_space/feature/debt/presentation/bloc/check_box_bloc/debt_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'debt_customn_button.dart';

class DentModalBottomSheet extends StatefulWidget {
  final DebtListModel? debtListModel;

  DentModalBottomSheet({super.key, this.debtListModel});

  @override
  State<DentModalBottomSheet> createState() => _DentModalBottomSheetState();
}

class _DentModalBottomSheetState extends State<DentModalBottomSheet> {
  TextEditingController name = TextEditingController();
  TextEditingController debt = TextEditingController();
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DebtBloc(),
      child: BlocBuilder<DebtBloc, DebtState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: 290,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'ФИО должника',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: debt,
                      decoration: InputDecoration(
                        hintText: 'Введите сумму',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Text('Выберите тариф и месяц',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                      ElevatedButton(
                        onPressed: () {
                          context.read<DebtBloc>().add(ShowMultiSelectEvent(
                              listOfTariff: Constants.tariff,
                              listOfMonth: Constants.month));
                        },
                        child: Text('Тариф и месяц'),
                      ),
                      SizedBox(),
                    ],
                  ),
                  DebtCustomButton(
                    debtModel: DebtGetModel(
                      name: name.text,
                      id: '',
                      debtPrice: debt.text,
                      debtTariff: state.selectedTariff,
                      debtMonth: state.selectedMonth,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
