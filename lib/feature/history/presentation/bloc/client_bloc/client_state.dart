part of 'client_bloc.dart';

class ClientState extends Equatable {
  final List<ClientModel> clientData;
  final List<EmployeeModel> employeeData;

  ClientState({required this.clientData, required this.employeeData});

  ClientState copyWith(
      {List<ClientModel>? clientData, List<EmployeeModel>? employeeData}) {
    return ClientState(
        clientData: clientData ?? this.clientData,
        employeeData: employeeData ?? this.employeeData);
  }

  @override
  List<Object?> get props => [clientData, employeeData];
}
