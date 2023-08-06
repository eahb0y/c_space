part of 'client_bloc.dart';

class ClientState extends Equatable {
  final List<ClientModel> clientData;

  ClientState({required this.clientData});

  ClientState copyWith({
    List<ClientModel>? clientData,
  }) {
    return ClientState(
      clientData: clientData ?? this.clientData,
    );
  }

  @override
  List<Object?> get props => [clientData];
}
