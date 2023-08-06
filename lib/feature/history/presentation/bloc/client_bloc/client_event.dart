part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable {}

class ClientGetTime extends ClientEvent{
  @override
  List<Object?> get props => [];

}