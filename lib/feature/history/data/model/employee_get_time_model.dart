class EmployeeModel {
  final String checkIn;
  final String checkOut;
  final String date;
  final String name;

  EmployeeModel({
    required this.checkIn,
    required this.checkOut,
    required this.name,
    required this.date,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      name: json['name'],
      date: json['date'],
    );
  }
}
