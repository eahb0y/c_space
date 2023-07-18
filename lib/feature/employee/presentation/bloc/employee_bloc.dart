import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';

part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  EmployeeBloc()
      : super(
          EmployeeState(
            employeeName: 'Employee',
            checkIn: '--/--',
            checkOut: '--/--',
          ),
        ) {
    on<GetAndSetEmployeeTime>(_setAndGet);
  }

  Future<void> _setAndGet(
      GetAndSetEmployeeTime event, Emitter<EmployeeState> emit
      ) async{
    await _setEmployee(event.name);
    await _getEmployee(event.name, emit);
  }

  Future<void> _getEmployee(String name, Emitter<EmployeeState> emit) async {
    try {
      final firebaseFirestore = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('100 hour')
          .collection(name)
          .doc(currentDay)
          .get();
      emit(
        state.copyWith(
          employeeName: name,
          checkIn: firebaseFirestore['checkIn'],
          checkOut: firebaseFirestore['checkOut'],
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(checkIn: '-/-', checkOut: '-/-', employeeName: 'eahb0y'),
      );
    }
  }
  Future<void> _setEmployee(String name) async {
    print(locationNameLocal);
    print("dataaaaaa");
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection(locationNameLocal)
        .doc('employee')
        .collection(name)
        .doc(currentDay)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(name)
          .doc(currentDay)
          .update({
        'checkIn': snap,
        'checkOut': currentTime,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(name)
          .doc(currentDay)
          .set({
        'checkIn': currentTime,
        'checkOut': "--/--",
      });
    }
  }
}
