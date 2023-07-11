part of 'time_bloc.dart';

@immutable
class TimeState extends Equatable {
  final String? clientTotalTime;

  TimeState({
    this.clientTotalTime,
  });

  TimeState copyWith({
    String? clientTotalTime,
  }) {
    return TimeState(
      clientTotalTime: clientTotalTime ?? this.clientTotalTime,
    );
  }

  @override
  List<Object?> get props => [clientTotalTime];
}
