part of 'time_bloc.dart';


class TimeState extends Equatable {
  final int? clientTotalTime;

  TimeState({
    this.clientTotalTime,
  });

  TimeState copyWith({
    int? clientTotalTime,
  }) {
    return TimeState(
      clientTotalTime: clientTotalTime ?? this.clientTotalTime,
    );
  }

  @override
  List<Object?> get props => [clientTotalTime];
}
