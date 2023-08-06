import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'client_set_time_event.dart';

part 'client_set_time_state.dart';

class ClientSetTimeBloc extends Bloc<ClientSetTimeEvent, ClientSetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();
  String randNum = (Random().nextInt(900000) + 100000).toString();


  ClientSetTimeBloc() : super(ClientSetTimeState()) {
    on<SetClientTime>(_setClient);
  }


  Future<void> _setClient(SetClientTime event,
      Emitter<ClientSetTimeState> emit) async {
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection(locationNameLocal)
        .doc(randNum)
        .get();
    try {
      String checkIn = snap2['checkIn'];
      String date = snap2['date'];
      String name = snap2['name'];
      String id = snap2['id'];

      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc(randNum)
          .update({
        'checkIn': checkIn,
        'checkOut': event.time,
        'date': date,
        'name': name,
        'id': id
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc(randNum)
          .set({
        'checkIn': event.time,
        'checkOut': "--/--",
        'date': Constants.currentDay,
        'name': event.name,
        'id': randNum
      });
    }
  }
}
