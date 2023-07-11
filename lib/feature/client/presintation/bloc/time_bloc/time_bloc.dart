import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  int totalMinutes = 0;
  late int clientTotalTime;

  TimeBloc() : super(TimeState(clientTotalTime: '5000')) {
    on<GetTotalTime>(_convertTime);
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

  Future<void> _convertTime(
      GetTotalTime event, Emitter<TimeState> emit) async {
    for (var element in event.clientDate) {
      if (element != '--/--') {
        String converting = convertTo24HourFormat(element.toString());
        List<String> parts = converting.split(':');
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        totalMinutes += hours * 60 + minutes;
      }
    }
    clientTotalTime = 6000 - totalMinutes;
    emit(TimeState(
      clientTotalTime: clientTotalTime.toString()
    ));
  }


}
