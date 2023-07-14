import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  List<String> timePairs = [
    '10:00:00', "11:30:00",
    '12:30:00', "14:00:00",
    '15:45:00', '--/--',
    '15:45:00', "17:00:00",
    '15:45:00', "17:00:00",
    '15:45:00', "--/--",
    '15:45:00', "17:00:00"
  ];

  List<int> timeDifferences = [];
  int time = 0;

  for (int i = 0; i < timePairs.length; i += 2) {
    String startTime = timePairs[i];
    String endTime = timePairs[i + 1];

    if (endTime == "--/--") {
      timeDifferences.add(0); // or any other value to represent missing end time
    } else {
      DateTime start = DateTime.parse('$currentDay ' + startTime);
      DateTime end = DateTime.parse('$currentDay '  + endTime);

      Duration difference = end.difference(start);
      int minutes = difference.inMinutes;

      timeDifferences.add(minutes);
      time += minutes;
    }
  }

  print("Time differences in minutes: $timeDifferences, $time");
}
