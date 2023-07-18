part of 'employee_bloc.dart';


abstract class EmployeeEvent extends Equatable{}

class GetAndSetEmployeeTime extends EmployeeEvent{
  final String name;

  GetAndSetEmployeeTime({required this.name});

  List<Object?> get props => [name];
}


