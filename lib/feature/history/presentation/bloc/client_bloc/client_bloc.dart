import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/history/data/model/client_get_time_model.dart';
import 'package:c_space/feature/history/data/model/employee_get_time_model.dart';
import 'package:c_space/feature/history/presentation/arguments/history_list_arguments.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'client_event.dart';

part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  String locationNameLocal = sl<LocalSource>().getLocation();

  ClientBloc()
      : super(ClientState(
          clientData: [],
          employeeData: [],
          totalTime: 6000,
        )) {
    on<ClientGetTime>(_getClient);
    on<EmployeeGetTime>(_getEmployee);
    on<ClientTotalTime>(_calculateTotalTime);
  }

  Future<void> _getClient(
      ClientGetTime event, Emitter<ClientState> emit) async {
    try {
      List<ClientModel> clientModal = [];
      final request = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('100 hour')
          .collection(event.name)
          .get();
      request.docs.forEach((element) {
        return clientModal.add(ClientModel.fromJson(element.data()));
      });
      emit(state.copyWith(clientData: clientModal));
      if (clientModal.isNotEmpty) {
        clientModal.forEach((element) {
          if (element.name == event.name) {
            Navigator.pushNamed(
                rootNavigatorKey.currentContext!, RoutName.historyList,
                arguments: HistoryListArguments(
                    date: element.date,
                    name: element.name,
                    checkIn: element.checkIn,
                    checkOut: element.checkOut,
                  state.totalTime
                ));
            return;
          }
        });
      }
    } catch (error) {
      print("cause of $error");
      emit(state.copyWith(clientData: []));
    }
  }

  Future<void> _getEmployee(
      EmployeeGetTime event, Emitter<ClientState> emit) async {
    try {
      List<EmployeeModel> employeeModal = [];
      final request = await FirebaseFirestore.instance
          .collection(locationNameLocal)
          .doc('employee')
          .collection(event.name)
          .orderBy('date')
          .get();
      request.docs.forEach((element) {
        return employeeModal.add(EmployeeModel.fromJson(element.data()));
      });
      emit(state.copyWith(employeeData: employeeModal));
      if (employeeModal.isNotEmpty) {
        employeeModal.forEach((element) {
          if (element.name == event.name) {
            Navigator.pushNamed(
                rootNavigatorKey.currentContext!, RoutName.historyList,
                arguments: HistoryListArguments(
                    date: element.date,
                    name: element.name,
                    checkIn: element.checkIn,
                    checkOut: element.checkOut,
                state.totalTime
                ));
            return;
          }
        });
      }
    } catch (error) {
      print("cause of $error");
      emit(state.copyWith(employeeData: []));
    }
  }

  Future<void> _calculateTotalTime(
      ClientTotalTime event, Emitter<ClientState> emit) async {
    int totalMinutes = 0;
    late int clientTotalTime;
    List<String> times = [];
    for (var time in state.clientData) {
      if (time.checkOut != '--/--') {
        times.addAll([time.checkIn, time.checkOut]);
        for (int i = 0; i < times.length; i += 2) {
          DateFormat format = DateFormat.Hm();
          String startTime = times[i];
          String endTime = times[i + 1].isEmpty
              ? DateFormat('HH:mm').format(DateTime.now())
              : times[i + 1];
          DateTime start = format.parse(startTime);
          DateTime end = format.parse(endTime);
          Duration difference = end.difference(start);
          int minutes = difference.inMinutes;
          totalMinutes += minutes;
        }
      }
    }
    clientTotalTime = 6000 - totalMinutes;
    emit(state.copyWith(totalTime: clientTotalTime.toInt()));
  }
}
