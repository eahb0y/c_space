
part of 'client_bloc.dart';

abstract class ClientGetTimeEvent extends Equatable{}

class ClientGetTime extends ClientGetTimeEvent{
  final String name;

  ClientGetTime({required this.name,});

  @override
  List<Object?> get props => [name,];
}

