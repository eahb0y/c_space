import 'package:c_space/constants.dart';
import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_state.dart';

part 'client_event.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc()
      : super(ClientState(
          name: '',
          clientData: [],
          hasUser: false,
        )) {
    on<GetAndSetClientTime>(_setAndGet);
  }



  Future<void> _setAndGet(
      GetAndSetClientTime event, Emitter<ClientState> emit) async {
    await _setClient(event.name, event.locationName);
    await _getClient(event.name, event.locationName, emit);
    // await _convertTime( emit);
  }

  Future<void> _getClient(
      String name, String locationName, Emitter<ClientState> emit) async {
    List<ClientModel> clientDate = [];
    try {
      final firebaseFirestore = await FirebaseFirestore.instance
          .collection(locationName)
          .doc('100 hour')
          .collection(name)
          .get();
      firebaseFirestore.docs.forEach((element) {
        return clientDate.add(ClientModel.fromJson(element.data()));
      });
      emit(ClientState(name: name, clientData: clientDate, hasUser: true));
    } catch (error) {
      emit(
        ClientState(
          name: 'error is $error',
          clientData: [],
          hasUser: false,
        ),
      );
    }
  }

  Future<void> _setClient(String name, String locationName) async {
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection(locationName)
        .doc('100 hour')
        .collection(name)
        .doc(currentDay)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection(locationName)
          .doc('100 hour')
          .collection(name)
          .doc(currentDay)
          .update({
        'checkIn': snap,
        'checkOut': currentTime,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection(locationName)
          .doc('100 hour')
          .collection(name)
          .doc(currentDay)
          .set({
        'checkIn': currentTime,
        'checkOut': "--/--",
      });
    }
  }




}
