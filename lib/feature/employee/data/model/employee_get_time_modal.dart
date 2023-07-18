import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeGetTimeModel {
  final String checkIn;
  final String checkOut;

  EmployeeGetTimeModel({required this.checkIn, required this.checkOut});

  factory EmployeeGetTimeModel.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return EmployeeGetTimeModel(
      checkIn: data['checkIn'],
      checkOut: data['checkOut'],
    );
  }
}
