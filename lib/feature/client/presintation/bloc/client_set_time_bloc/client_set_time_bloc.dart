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

  ClientSetTimeBloc() : super(ClientSetTimeState()) {
    on<SetClientTime>(_setClient);
  }


  Future<void> _setClient(SetClientTime event, Emitter<ClientSetTimeState> emit) async {
    print(locationNameLocal);
    print("dataaaaaa");
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection(locationNameLocal)
        .doc('100 hour')
        .collection(event.name)
        .doc(currentDay)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('100 hour')
          .collection(event.name)
          .doc(currentDay)
          .update({
        'checkIn': snap,
        'checkOut': currentTime,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('100 hour')
          .collection(event.name)
          .doc(currentDay)
          .set({
        'checkIn': currentTime,
        'checkOut': "--/--",
      });
    }
  }
}
