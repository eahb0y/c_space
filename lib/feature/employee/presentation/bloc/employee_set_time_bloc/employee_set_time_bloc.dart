import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'employee_set_time_event.dart';
part 'employee_set_time_state.dart';

class EmployeeSetTimeBloc extends Bloc<EmployeeSetTimeEvent, EmployeeSetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  EmployeeSetTimeBloc() : super(EmployeeSetTimeState()) {
    on<EmployeeSetTime>(_setEmployee);
  }

  Future<void> _setEmployee(EmployeeSetTime event, Emitter<EmployeeSetTimeState> emit) async {
    print(locationNameLocal);
    print("dataaaaaa");
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection(locationNameLocal)
        .doc('employee')
        .collection(event.name)
        .doc(currentDay)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(currentDay)
          .update({
        'checkIn': snap,
        'checkOut': currentTime,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .doc(currentDay)
          .set({
        'checkIn': currentTime,
        'checkOut': "--/--",
      });
    }
  }
}
