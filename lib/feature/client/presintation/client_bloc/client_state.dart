part of 'client_bloc.dart';

class ClientState extends Equatable {
  final List<ClientModel> clientData;
  final String name;
  final double? clientTotalTime;

  ClientState({
    required this.name,
    required this.clientData,
    this.clientTotalTime,
  });

  ClientState copyWith({
    List<ClientModel>? clientData,
    String? name,
    double? clientTotalTime,
  }) {
    return ClientState(
      name: name ?? this.name,
      clientData: clientData ?? this.clientData,
      clientTotalTime: clientTotalTime ?? this.clientTotalTime,
    );
  }

  @override
  List<Object?> get props => [name, clientData, clientTotalTime];
}

