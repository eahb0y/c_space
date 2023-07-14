import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:equatable/equatable.dart';

part 'time_event.dart';

part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  int totalMinutes = 0;
  late int clientTotalTime;

  TimeBloc() : super(TimeState(clientTotalTime: '5000')) {
    on<GetTotalTime>(_calculateTotalTime);
  }
  Future<void> _calculateTotalTime(GetTotalTime event, Emitter<TimeState> emit) async {
    List<String> times = [];
    for(var time in event.clientDate){
      times.addAll([time.checkIn, time.checkOut]);
    }
    print(times);
  }


}
