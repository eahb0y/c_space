
part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable{}

class SentDataToServer extends ClientEvent{
  final String client;
  SentDataToServer({required this.client});
  @override
  List<Object?> get props => [];
}

class GetClientTime extends ClientEvent {
  final String name;
  GetClientTime({required this.name});
  @override
  List<Object?> get props => [];
}

class ClientAllTime extends ClientEvent{
  ClientAllTime();
  @override
  List<Object?> get props => [];
}

class GetAndSetClientTime extends ClientEvent{
  final String locationName;
  final String name;
  GetAndSetClientTime({required this.name, required this.locationName});

  @override
  List<Object?> get props => [name, locationName];
}
