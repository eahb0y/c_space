part of 'employee_bloc.dart';

class EmployeeState extends Equatable {
  final String employeeName;
  final String checkIn;
  final String checkOut;

  EmployeeState({
    required this.employeeName,
    required this.checkIn,
    required this.checkOut,
  });

  EmployeeState copyWith({
    String? employeeName,
    String? checkIn,
    String? checkOut,
  }) {
    return EmployeeState(
      employeeName: employeeName ?? this.employeeName,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
    );
  }

  List<Object?> get props => [employeeName];
}
