import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'employee_get_time_event.dart';

part 'employee_get_time_state.dart';

class EmployeeGetTimeBloc
    extends Bloc<EmployeeGetTimeEvent, EmployeeGetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  EmployeeGetTimeBloc()
      : super(EmployeeGetTimeState(
            checkIn: '--/--', checkOut: '--/--', employeeName: 'Работник')){
    on<EmployeeGetTime>(_getEmployee);
  }

  Future<void> _getEmployee(
    EmployeeGetTime event,
    Emitter<EmployeeGetTimeState> emit,
  ) async {
    print("I am getting data from base");
    await Future.delayed( Duration(seconds: 1));
    print(event.name);
    try {
       await Future.delayed( Duration(seconds: 1));
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(currentDay)
          .get();
      print(snap['checkOut']);
      emit(
        state.copyWith(
          employeeName: event.name,
          checkIn: snap['checkIn'],
          checkOut: snap['checkOut'],
        ),
      );
    } catch (error) {
      print("$error asdasdadasda");
      emit(
        state.copyWith(checkIn: '-/-', checkOut: '-/-', employeeName: 'eahb0y'),
      );
    }
  }
}
