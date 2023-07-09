
part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable{}

class GetAndSetClientTime extends ClientEvent{
  final String locationName;
  final String name;
  GetAndSetClientTime({required this.name, required this.locationName});

  @override
  List<Object?> get props => [name, locationName];
}
