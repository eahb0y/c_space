import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'employee_set_time_event.dart';

part 'employee_set_time_state.dart';

class EmployeeSetTimeBloc extends Bloc<EmployeeSetTimeEvent, EmployeeSetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();
  String randNum = (Random().nextInt(900000) + 100000).toString();

  EmployeeSetTimeBloc() : super(EmployeeSetTimeState()) {
    on<EmployeeSetTime>(_setEmployee);
  }

  Future<void> _setEmployee(
    EmployeeSetTime event,
    Emitter<EmployeeSetTimeState> emit,
  ) async {
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection(locationNameLocal)
        .doc('employee')
        .collection(event.name)
        .doc(Constants.currentDay)
        .get();
    try {
      String checkIn = snap2['checkIn'];
      String date = snap2['date'];

      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(Constants.currentDay)
          .update({
        'checkIn': checkIn,
        'checkOut': event.time,
        'date': date,
        'name': event.name
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(Constants.currentDay)
          .set({
        'checkIn': event.time,
        'checkOut': "--/--",
        'date': Constants.currentDay,
        'name': event.name
      });
    }
    sl<LocalEmployeeSource>().setEmployee(event.name);
  }
}
