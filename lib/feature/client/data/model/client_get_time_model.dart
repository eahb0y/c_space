// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
//
// class Client {
//   final String name;
//   final String checkInTime;
//   final String checkOutTime;
//
//   Client({
//     required this.checkInTime,
//     required this.checkOutTime,
//     this.name = '',
//   });
//
//   Future addChekInChekOutTime(Client client) async {
//     String currentDay = DateFormat('dd-MM-yyyy').format(DateTime.now());
//     DocumentSnapshot snap2 = await FirebaseFirestore.instance
//         .collection('Maksim Gorkiy')
//         .doc('100 hour')
//         .collection(client.name)
//         .doc(currentDay)
//         .get();
//     try {
//       String snap = snap2['checkIn'];
//       await FirebaseFirestore.instance
//           .collection('Maksim Gorkiy')
//           .doc('100 hour')
//           .collection(client.name)
//           .doc(currentDay)
//           .update({
//         'checkIn': snap,
//         'checkOut': client.checkOutTime,
//       });
//     } catch (e) {
//       await FirebaseFirestore.instance
//           .collection('Maksim Gorkiy')
//           .doc('100 hour')
//           .collection(client.name)
//           .doc(currentDay)
//           .set({
//         'checkIn': client.checkInTime,
//         'checkOut': "--/--",
//       });
//     }
//   }
//
//   factory Client.fromJson(Map<String, dynamic> json) {
//     return Client(checkInTime: json['checkIn'], checkOutTime: json['checkOut']);
//   }
// }

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
