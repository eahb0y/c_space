import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/feature/debt/data/model/debt_get_model.dart';
import 'package:c_space/feature/debt/data/model/debt_list_model.dart';
import 'package:c_space/feature/debt/presentation/pages/widgets/debt_tariff_multi_select.dart';
import 'package:c_space/router/rout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'debt_event.dart';

part 'debt_state.dart';

class DebtBloc extends Bloc<DebtEvent, DebtState> {
  DebtBloc() : super(DebtState(selectedTariff: [], selectedMonth: [])) {
    on<ShowMultiSelectEvent>(_showMultiSelect);
    on<ItemChangeEvent>(_itemChange);
    on<SubmitEvent>(_submit);
    on<CancelEvent>(_cancel);
    on<MonthItemChangeEvent>(_monthItemChange);
  }

  Future<void> _showMultiSelect(
      ShowMultiSelectEvent event, Emitter<DebtState> emit) async {
    List<String> selectTariffItem = [];
    selectTariffItem.addAll(state.selectedTariff ?? []);

    List<String> selectMonthItem = [];
    selectMonthItem.addAll(state.selectedMonth ?? []);

    var response = await showDialog(
      builder: (BuildContext context) {
        return DebtTariffMultiSelect(
          listOfMonth: event.listOfMonth,
          listOfTariff: event.listOfTariff,
        );
      },
      context: rootNavigatorKey.currentContext!,
    );
    if (response is DebtListModel) {
      print("argument ress");
      print(response.selectedTariff);
      print(response.selectedMonth);
      emit(state.copyWith(
          selectedTariff: response.selectedTariff,
          selectedMonth: response.selectedMonth));
    }
  }

  Future<void> _itemChange(
      ItemChangeEvent event, Emitter<DebtState> emit) async {
    List<String> selectTariff = [];
    selectTariff.addAll(state.selectedTariff ?? []);
    if (event.isSelectedTariff) {
      selectTariff.add(event.itemValue);
    } else {
      selectTariff.remove(event.itemValue);
    }
    emit(state.copyWith(selectedTariff: selectTariff));
  }

  Future<void> _submit(SubmitEvent event, Emitter<DebtState> emit) async {
    Navigator.pop(
      rootNavigatorKey.currentContext!,
      DebtListModel(
        selectedMonth: state.selectedMonth ?? [],
        selectedTariff: state.selectedTariff ?? [],
      ),
    );
    emit(state.copyWith(
        selectedTariff: state.selectedTariff,
        selectedMonth: state.selectedMonth));
    print(state.selectedTariff);
    print(state.selectedMonth);
  }

  Future<void> _cancel(CancelEvent event, Emitter<DebtState> emit) async {
    Navigator.pop(rootNavigatorKey.currentContext!);
  }

  Future<void> _monthItemChange(
      MonthItemChangeEvent event, Emitter<DebtState> emit) async {
    List<String> selectMonth = [];
    selectMonth.addAll(state.selectedMonth ?? []);
    if (event.isSelectedMonth) {
      selectMonth.add(event.itemValue);
    } else {
      selectMonth.remove(event.itemValue);
    }
    emit(state.copyWith(selectedMonth: selectMonth));
  }
}
