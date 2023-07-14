class TimeParse{
  static DateTime parseTime(String time) {
    final now = DateTime.now();
    final parts = time.split(':');

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}