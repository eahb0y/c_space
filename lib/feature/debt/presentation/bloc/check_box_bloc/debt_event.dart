part of 'debt_bloc.dart';

sealed class DebtEvent extends Equatable {}

class ItemChangeEvent extends DebtEvent {
  final String itemValue;
  final bool isSelectedTariff;

  ItemChangeEvent(this.isSelectedTariff, this.itemValue);

  @override
  List<Object?> get props => [itemValue, isSelectedTariff];
}

class ShowMultiSelectEvent extends DebtEvent {
  final List<String> listOfMonth;
  final List<String> listOfTariff;

  ShowMultiSelectEvent({required this.listOfTariff, required this.listOfMonth});

  @override
  List<Object?> get props => [listOfTariff, listOfMonth];
}

class SubmitEvent extends DebtEvent {
  @override
  List<Object?> get props => [];
}

class CancelEvent extends DebtEvent {
  @override
  List<Object?> get props => [];
}

class MonthItemChangeEvent extends DebtEvent {
  final String itemValue;
  final bool isSelectedMonth;

  MonthItemChangeEvent(this.isSelectedMonth, this.itemValue);

  @override
  List<Object?> get props => [itemValue, isSelectedMonth];
}

class AddDebtorEvent extends DebtEvent {
  final DebtGetModel debtModel;

  AddDebtorEvent({
    required this.debtModel,
  });

  @override
  List<Object?> get props => [debtModel];
}




