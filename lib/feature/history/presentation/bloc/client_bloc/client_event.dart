part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable {}

class ClientGetTime extends ClientEvent {
  final String name;

  ClientGetTime({required this.name});

  @override
  List<Object?> get props => [name];
}

class EmployeeGetTime extends ClientEvent {
  final String name;

  EmployeeGetTime({required this.name});

  @override
  List<Object?> get props => [name];
}