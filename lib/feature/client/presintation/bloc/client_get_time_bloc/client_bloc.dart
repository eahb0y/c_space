import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_state.dart';

part 'client_event.dart';

class ClientGetTimeBloc extends Bloc<ClientGetTimeEvent, ClientGetTimeState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  ClientGetTimeBloc() : super(ClientGetTimeState(name: 'Клиент', clientData: [])) {
    on<ClientGetTime>(_getClient);
  }
  Future<void> _getClient(ClientGetTime event, Emitter<ClientGetTimeState> emit) async {
    List<ClientModel> clientDate = [];
    try {
      final firebaseFirestore = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('100 hour')
          .collection(event.name)
          .get();
      firebaseFirestore.docs.forEach((element) {
        return clientDate.add(ClientModel.fromJson(element.data()));
      });
      emit(ClientGetTimeState(name: event.name, clientData: clientDate));
    } catch (error) {
      emit(
        ClientGetTimeState(
          name: 'error is $error',
          clientData: [],
        ),
      );
      print("$error   dfsafasadsada");
    }
  }
}
