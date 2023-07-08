//
// import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
// import 'package:c_space/feature/client/domain/entity/client_request_entity.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'client_remote_data_source.dart';
//
//
// class ClientRemoteDataSourceImpl extends ClientRemoteDataSource {
//   @override
//   Future<ClientModel> getClientTime(ClientRequestEntity clientRequestEntity) async {
//     try {
//       final firebaseFirestore = FirebaseFirestore.instance;
//       final collectionRef = firebaseFirestore
//           .collection('Maksim Gorkiy')
//           .doc('100 hour')
//           .collection(clientRequestEntity.toString());
//
//       final snapshot = await collectionRef.snapshots().first;
//       if (snapshot.docs.isNotEmpty) {
//         return ClientModel.fromJson(snapshot.docs.map((doc) {
//           doc.data();
//         }));
//       }
//       print('can`t get data');
//       throw "Error";
//     } on FirebaseException catch (e) {
//       print('Error fetching client time: $e');
//       throw 'Error fetching client time: $e';
//     }
//   }
// }
