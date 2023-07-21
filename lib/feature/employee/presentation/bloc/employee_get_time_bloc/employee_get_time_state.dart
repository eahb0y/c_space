part of 'employee_get_time_bloc.dart';


class EmployeeGetTimeState extends Equatable {
  final String employeeName;
  final String checkIn;
  final String? checkOut;
  EmployeeGetTimeState({
    required this.employeeName,
    required this.checkIn,
    required this.checkOut,
});
  EmployeeGetTimeState copyWith({
    String? employeeName,
    String? checkIn,
    String? checkOut,
}){
    return EmployeeGetTimeState(
        employeeName: employeeName ?? this.employeeName,
        checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut
    );
  }
  @override
  List<Object?> get props => [checkIn, checkOut, employeeName];

}
