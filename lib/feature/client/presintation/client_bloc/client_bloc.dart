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
          clientTotalTime: 6000,
        )) {
    on<GetAndSetClientTime>(_setAndGet);
  }

  int totalMinutes = 0;
  late int clientTotalTime;

  Future<void> _setAndGet(
      GetAndSetClientTime event, Emitter<ClientState> emit) async {
    await _setClient(event.name, event.locationName);
    await _getClient(event.name, event.locationName, emit);
  }

  Future<void> _getClient(
      String name, String locationName, Emitter<ClientState> emit) async {
    List<ClientModel> clientDate = [];
    List<String> convertedTimes = [];

    try {
      final firebaseFirestore = await FirebaseFirestore.instance
          .collection(locationName)
          .doc('100 hour')
          .collection(name)
          .get();
      firebaseFirestore.docs.forEach((element) {
        return clientDate.add(ClientModel.fromJson(element.data()));
      });
      emit(ClientState(
        name: name,
        clientData: clientDate,
      ));
    } catch (error) {
      emit(
        ClientState(
          name: 'error is $error',
          clientData: [],
          clientTotalTime: 0,
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

  String convertTo24HourFormat(String time) {
    List<String> timeParts = time.split(' ');
    String timeString = timeParts[0];
    String meridiem = timeParts.length > 1 ? timeParts[1].toUpperCase() : '';
    List<String> timeDigits = timeString.split(':');
    int hours = int.parse(timeDigits[0]);
    int minutes = int.parse(timeDigits[1]);
    int seconds = timeDigits.length > 2 ? int.parse(timeDigits[2]) : 0;
    if (meridiem == 'PM' && hours < 12) {
      hours += 12;
    } else if (meridiem == 'AM' && hours == 12) {
      hours = 0;
    }
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}
