part of 'employee_get_time_bloc.dart';

abstract class EmployeeGetTimeEvent extends Equatable {}

class EmployeeGetTime extends EmployeeGetTimeEvent {
  final String name;

  EmployeeGetTime({required this.name});

  @override
  List<Object?> get props => [name];
}
