part of 'client_bloc.dart';

class ClientGetTimeState extends Equatable {
  final List<ClientModel> clientData;
  final String name;

  ClientGetTimeState({
    required this.name,
    required this.clientData,
  });

  ClientGetTimeState copyWith({
    List<ClientModel>? clientData,
    String? name,
    bool? hasUser,
  }) {
    return ClientGetTimeState(
      name: name ?? this.name,
      clientData: clientData ?? this.clientData,
    );
  }

  @override
  List<Object?> get props => [name, clientData,];
}

