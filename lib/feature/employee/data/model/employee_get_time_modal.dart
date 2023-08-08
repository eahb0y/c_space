import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeGetTimeModel {
  final String checkIn;
  final String checkOut;
  final String date;
  final String name;

  EmployeeGetTimeModel({
    required this.checkIn,
    required this.checkOut,
    required this.name,
    required this.date,
  });

  factory EmployeeGetTimeModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return EmployeeGetTimeModel(
      name: data['name'],
      date: data['date'],
      checkIn: data['checkIn'],
      checkOut: data['checkOut'],
    );
  }
}
