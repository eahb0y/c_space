import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'employee_get_time_event.dart';

part 'employee_get_time_state.dart';

class EmployeeGetTimeBloc
    extends Bloc<EmployeeGetTimeEvent, EmployeeGetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  EmployeeGetTimeBloc()
      : super(EmployeeGetTimeState(
            checkIn: '--/--', checkOut: '--/--', employeeName: 'Работник')) {
    on<EmployeeGetTime>(_getEmployee);
  }

  Future<void> _getEmployee(
      EmployeeGetTime event, Emitter<EmployeeGetTimeState> emit) async {
    try {
      DocumentSnapshot snap = await FirebaseFirestore
          .instance
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
      print(snap['checkOut']);
      print(snap['checkOut']);
      print(snap['checkIn']);
      print(snap['checkIn']);
      print(snap['checkOut']);
    } catch (error) {
      print("$error adasdasdasdasdasdasdadasfsdfg");
      emit(
        state.copyWith(checkIn: '-/-', checkOut: '-/-', employeeName: 'eahb0y'),
      );
    }
  }
}
