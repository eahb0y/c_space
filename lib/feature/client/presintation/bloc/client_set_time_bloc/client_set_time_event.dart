part of 'client_set_time_bloc.dart';


abstract class ClientSetTimeEvent extends Equatable {}

class SetClientTime extends ClientSetTimeEvent{
  final String name;
  SetClientTime({required this.name});
  @override
  List<Object?> get props => [name,];}
