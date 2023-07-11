part of 'client_bloc.dart';

class ClientState extends Equatable {
  final List<ClientModel> clientData;
  final String name;
  final bool hasUser;

  ClientState({
    required this.name,
    required this.clientData,
    required this.hasUser,
  });

  ClientState copyWith({
    List<ClientModel>? clientData,
    String? name,
    bool? hasUser,
  }) {
    return ClientState(
      name: name ?? this.name,
      clientData: clientData ?? this.clientData,
      hasUser: hasUser ?? this.hasUser,
    );
  }

  @override
  List<Object?> get props => [name, clientData, hasUser];
}

