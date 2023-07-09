class ClientModel {
  final String checkIn;
  final String checkOut;

  ClientModel({
    required this.checkIn,
    required this.checkOut,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
    );
  }
}
