import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/time_tracker/data/model/client_get_time_model.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  ClientBloc() : super(ClientState(clientData: [])) {
    on<ClientGetTime>(_getClient);
  }


  Future<void> _getClient(ClientGetTime event, Emitter<ClientState> emit) async {
    try {
      List<ClientModel> clientModal = [];
      final request =
      await FirebaseFirestore.instance.collection(locationNameLocal).get();
      request.docs.forEach((element) {
        return clientModal.add(ClientModel.fromJson(element.data()));
      });
      emit(state.copyWith(clientData: clientModal));
    } catch (error) {
      print("cause of $error");
      emit(state.copyWith(clientData: []));
    }
  }
}
