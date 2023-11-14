part of 'debt_add_bloc.dart';

abstract class DebtAddEvent extends Equatable {}

class AddDebtorEvent extends DebtAddEvent {
  final DebtGetModel debtModel;

  AddDebtorEvent({
    required this.debtModel,
  });

  @override
  List<Object?> get props => [debtModel];
}
