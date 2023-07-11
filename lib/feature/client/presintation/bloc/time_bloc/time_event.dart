part of 'time_bloc.dart';

@immutable
abstract class TimeEvent extends Equatable {}

class GetTotalTime extends TimeEvent{
  final List<ClientModel> clientDate;
  GetTotalTime({required this.clientDate});
  @override
  List<Object?> get props => [clientDate];
}
