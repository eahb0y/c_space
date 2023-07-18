
part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable{}

class GetAndSetClientTime extends ClientEvent{
  final String name;

  GetAndSetClientTime({required this.name,});

  @override
  List<Object?> get props => [name,];
}

