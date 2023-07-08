part of 'client_bloc.dart';


abstract class ClientState extends Equatable{}

class ClientInitialState extends ClientState {
  @override
  List<Object?> get props => [];
}

class ClientErrorState extends ClientState {
  final String message;
  ClientErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class ClientSuccessGetTimeState extends ClientState {
  final List<ClientModel> clientData;
  ClientSuccessGetTimeState(this.clientData);
  @override
  List<Object?> get props => [clientData];
}

class ClientSuccessSetTimeState extends ClientState{
  final String name;
  ClientSuccessSetTimeState({required this.name});
  @override
  List<Object?> get props => [name];

}