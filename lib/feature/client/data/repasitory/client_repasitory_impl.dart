import 'package:c_space/constants.dart';
import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/feature/client/data/model/client_set_time_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ClientRepository {
  Future<List<ClientModel>> getClientTime() async {
    List<ClientModel> clientDate = [];

    try {
      final firebaseFirestore = await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('100 hour')
          .collection('Jasur')
          .get();
      firebaseFirestore.docs.forEach((element) {
        return clientDate.add(ClientModel.fromJson(element.data()));
      });
      return clientDate;
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print('Failed with error ${error.code} : ${error.message}');
      }
      return clientDate;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> setClientTime(ClientSetTimeModel setTimeModel) async{
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection('Maksim Gorkiy')
        .doc('100 hour')
        .collection(setTimeModel.name)
        .doc(currentDay)
        .get();
    try {
      String snap = snap2['checkIn'];
      await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('100 hour')
          .collection(setTimeModel.name)
          .doc(setTimeModel.date)
          .update({
        'checkIn': snap,
        'checkOut': currentTime,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection('Maksim Gorkiy')
          .doc('100 hour')
          .collection(setTimeModel.name)
          .doc(setTimeModel.date)
          .set({
        'checkIn': currentTime,
        'checkOut': "--/--",
      });
    }
  }
}
