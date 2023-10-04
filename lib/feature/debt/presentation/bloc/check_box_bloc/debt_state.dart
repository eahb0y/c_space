part of 'debt_bloc.dart';

class DebtState extends Equatable {
  final List<String>? selectedTariff;
  final List<String>? selectedMonth;

  DebtState({
     this.selectedTariff,
    this.selectedMonth,
  });

  DebtState copyWith({
     List<String>? selectedTariff,
     List<String>? selectedMonth,
  }) {
    return DebtState(
      selectedTariff: selectedTariff ?? this.selectedTariff,
      selectedMonth: selectedMonth ?? this.selectedMonth,
    );
  }

  @override
  List<Object?> get props => [selectedTariff, selectedMonth];
}
