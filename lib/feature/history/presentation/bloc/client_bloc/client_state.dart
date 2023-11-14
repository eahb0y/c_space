part of 'client_bloc.dart';

class ClientState extends Equatable {
  final List<ClientModel> clientData;
  final List<EmployeeModel> employeeData;
  final int totalTime;

  ClientState(
      {required this.clientData,
      required this.employeeData,
      required this.totalTime});

  ClientState copyWith({
    List<ClientModel>? clientData,
    List<EmployeeModel>? employeeData,
    int? totalTime,
  }) {
    return ClientState(
      clientData: clientData ?? this.clientData,
      employeeData: employeeData ?? this.employeeData,
      totalTime: totalTime ?? this.totalTime,
    );
  }

  @override
  List<Object?> get props => [
        clientData,
        employeeData,
        totalTime,
      ];
}
