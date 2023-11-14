class ClientModel {
  final String checkIn;
  final String checkOut;
  final String date;
  final String name;

  ClientModel({
    required this.checkIn,
    required this.checkOut,
    required this.name,
    required this.date,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      name: json['name'],
      date: json['date'],
    );
  }
}
