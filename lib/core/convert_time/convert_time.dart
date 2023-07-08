class ConvertTime{
  String convertTo24HourFormat(String time){
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
    String formattedTime = '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}