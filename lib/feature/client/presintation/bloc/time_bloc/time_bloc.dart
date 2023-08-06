import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/feature/time_tracker/data/model/client_get_time_model.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'time_event.dart';

part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  int totalMinutes = 0;
  late int clientTotalTime;


  TimeBloc() : super(TimeState(clientTotalTime: 6000)) {
    on<GetTotalTime>(_calculateTotalTime);
  }
  Future<void> _calculateTotalTime(GetTotalTime event, Emitter<TimeState> emit) async {
    List<String> times = [];
    for(var time in event.clientDate){
      if(time.checkIn != '--/--' || time.checkOut != '--/--'){
        times.addAll([time.checkIn, time.checkOut]);
        for (int i = 0; i < times.length; i += 2) {
          DateFormat format = DateFormat.Hm();
          String startTime = times[i];
          String endTime = times[i + 1].isEmpty ? Constants.currentTime : times[i+1];
          DateTime start = format.parse(startTime);
          DateTime end = format.parse(endTime);

          print('timessssssssssss');
          print(start);
          print(end);
          print('timessssssssssss');

          Duration difference = end.difference(start);
          int minutes = difference.inMinutes;
          totalMinutes += minutes;
        }
      }
    }
    clientTotalTime = 6000 - totalMinutes;
    print(clientTotalTime);
    emit(state.copyWith(clientTotalTime: clientTotalTime));
  }


}
