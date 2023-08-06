part of 'client_set_time_bloc.dart';

abstract class ClientSetTimeEvent extends Equatable {}

class SetClientTime extends ClientSetTimeEvent {
  final String time;
  final String name;

  SetClientTime({required this.name, required this.time});

  @override
  List<Object?> get props => [name, time];
}
