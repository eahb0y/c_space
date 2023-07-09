void main(){
    List<String> time = [
      '5:12:02 PM',
      '7:51:21 AM',
      '1:21:09 PM',
      '8:36:33 AM',
      '5:55:46 PM',
      '2:44:17 AM',
      '10:22:12 PM',
      '--/--',
      '11:10:14 AM',
      '9:03:60 PM',
    ];
    List<String> convertedTimes = [];
    int totalMinutes = 0;
    late int clientTotalTime;



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

    void converTime(List<String>listOfTime){

      for (var element in listOfTime) {
        if (element != '--/--') {
          String converting = convertTo24HourFormat(element.toString());
          convertedTimes.add(converting);
          List<String> parts = element.split(':');
          int hours = int.parse(parts[0]);
          int minutes = int.parse(parts[1]);
          totalMinutes += hours * 60 + minutes;
        }
      }
      clientTotalTime = 6000 - totalMinutes;

    }
    converTime(time);

    print(convertedTimes);
    print(totalMinutes);
    print(clientTotalTime);

  }