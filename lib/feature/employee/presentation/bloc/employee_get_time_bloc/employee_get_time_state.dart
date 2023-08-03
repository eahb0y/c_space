part of 'employee_get_time_bloc.dart';

class EmployeeGetTimeState extends Equatable {
  final String? employeeName;
  final String? checkIn;
  final String? checkOut;
  final bool? isLoading;
  final EmployeeGetTimeModel? timeModel;

  EmployeeGetTimeState(
      {this.employeeName, this.checkIn, this.checkOut, this.isLoading, this.timeModel});

  EmployeeGetTimeState copyWith({
    String? employeeName,
    String? checkIn,
    String? checkOut,
    bool? isLoading,
    EmployeeGetTimeModel? timeModel,
  }) {
    return EmployeeGetTimeState(
      employeeName: employeeName ?? this.employeeName,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      isLoading: isLoading ?? this.isLoading,
      timeModel: timeModel ?? this.timeModel,
    );
  }

  @override
  List<Object?> get props => [checkIn, checkOut, employeeName, isLoading, timeModel];
}
