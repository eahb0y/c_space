import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/employee_get_time_modal.dart';

part 'employee_get_time_event.dart';

part 'employee_get_time_state.dart';

class EmployeeGetTimeBloc
    extends Bloc<EmployeeGetTimeEvent, EmployeeGetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  EmployeeGetTimeBloc()
      : super(EmployeeGetTimeState(
      checkIn: '--/--',
      checkOut: '--/--',
      employeeName: 'Работник',
      timeModel: null)) {
    on<EmployeeGetTime>(_getEmployee);
  }

  Future<void> _getEmployee(EmployeeGetTime event,
      Emitter<EmployeeGetTimeState> emit,) async {
    await Future.delayed(Duration(seconds: 1));
    print(event.name);
    try {
      await Future.delayed(Duration(seconds: 1));
      var snap = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(currentDay)
          .get()
          .then((value) async {
        await Future.delayed(Duration(seconds: 1));
        if (value.exists) {
          return emit(
            state.copyWith(
                checkIn: value['checkIn'],
                checkOut: value['checkOut'],
                employeeName: event.name,
                timeModel: EmployeeGetTimeModel.fromJson(value)
            ),

          );
        } else {
          return emit(
            state.copyWith(
                checkIn: '-/-', checkOut: '-/-', employeeName: event.name),
          );
        }
      });
    } catch (error) {
      var snap = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(currentDay)
          .get()
          .then((value) async {
        await Future.delayed(Duration(seconds: 1));
        if (value.exists) {
          return emit(
            state.copyWith(
                employeeName: event.name,
                timeModel: EmployeeGetTimeModel.fromJson(value)
            ),

          );
        } else {
          return emit(
            state.copyWith(
                checkIn: 'нет', checkOut: 'нет', employeeName: event.name),
          );
        }
      });
    }
  }
}
