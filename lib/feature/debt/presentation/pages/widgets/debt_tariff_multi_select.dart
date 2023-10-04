import 'package:c_space/feature/debt/presentation/bloc/check_box_bloc/debt_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebtTariffMultiSelect extends StatefulWidget {
  final List<String> listOfTariff;
  final List<String> listOfMonth;

  const DebtTariffMultiSelect(
      {Key? key, required this.listOfTariff, required this.listOfMonth})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DebtTariffMultiSelectState();
}

class _DebtTariffMultiSelectState extends State<DebtTariffMultiSelect> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DebtBloc(),
      child: BlocBuilder<DebtBloc, DebtState>(
        builder: (context, state) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            // contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: const Text('Выберите тариф и месяц'),
            content: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListBody(
                      children: widget.listOfTariff
                          .map((item) =>
                          CheckboxListTile(
                              value: state.selectedTariff?.contains(item),
                              title: Text(item),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (isChecked) =>
                                  context
                                      .read<DebtBloc>()
                                      .add(ItemChangeEvent(isChecked!, item))))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: ListBody(
                      children: widget.listOfMonth
                          .map((item) =>
                          CheckboxListTile(
                              value: state.selectedMonth?.contains(item),
                              title: Text(item),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (isChecked) =>
                                  context
                                      .read<DebtBloc>()
                                      .add(
                                      MonthItemChangeEvent(isChecked!, item))))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => context.read<DebtBloc>().add(CancelEvent()),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => context.read<DebtBloc>().add(SubmitEvent()),
                child: const Text('Submit'),
              ),
            ],
          );
        },
      ),
    );
  }
}
