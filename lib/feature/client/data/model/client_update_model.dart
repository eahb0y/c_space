class ClientUpdateModel {
  final String checkIn;
  final String checkOut;
  final String date;
  final String name;
  final String id;

  ClientUpdateModel({
    required this.checkIn,
    required this.checkOut,
    required this.name,
    required this.date,
    required this.id,
  });

  factory ClientUpdateModel.fromJson(Map<String, dynamic> json) {
    return ClientUpdateModel(
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      name: json['name'],
      date: json['date'],
      id: json['id'],
    );
  }
}