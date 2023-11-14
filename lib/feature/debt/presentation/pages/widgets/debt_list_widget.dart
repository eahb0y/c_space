import 'package:c_space/core/functions/base_functions.dart';
import 'package:c_space/feature/debt/data/model/debt_get_model.dart';
import 'package:flutter/material.dart';

class DebtListWidget extends StatelessWidget {
  final List<DebtGetModel> debtModal;
  const DebtListWidget({super.key, required this.debtModal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
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
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(debtModal[index].name),
                          Text(BaseFunctions.moneyFormat(int.parse(debtModal[index].debtPrice))),
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
                                    'Тариф : ${debtModal[index].debtTariff}'),
                                Text(
                                    'Месяц : ${debtModal[index].debtMonth}'),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
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
          itemCount: debtModal.length),
    );
  }
}
