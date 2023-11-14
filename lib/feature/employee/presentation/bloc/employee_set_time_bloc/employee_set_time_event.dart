part of 'employee_set_time_bloc.dart';

abstract class EmployeeSetTimeEvent extends Equatable {}

class EmployeeSetTime extends EmployeeSetTimeEvent{
  final String time;
  final String name;
  EmployeeSetTime({required this.name, required this.time});
  @override
  List<Object?> get props => [name, time];
  
}
