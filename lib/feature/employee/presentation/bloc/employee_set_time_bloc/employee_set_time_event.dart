part of 'employee_set_time_bloc.dart';

@immutable
abstract class EmployeeSetTimeEvent extends Equatable {}

class EmployeeSetTime extends EmployeeSetTimeEvent{
  final String name;
  EmployeeSetTime({required this.name});
  @override
  List<Object?> get props => [name];
  
}
