class HistoryListArguments {
  final String date;
  final String checkIn;
  final String checkOut;
  final String name;
  final int? time;

  HistoryListArguments(this.time, {
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.name,
  });
}
