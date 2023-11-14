import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/problems/data/model/issue_get_time_model.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'issue_get_event.dart';

part 'issue_get_state.dart';

class IssueGetBloc extends Bloc<IssueEvent, IssueGetState> {
  String locationNameLocal = sl<LocalSource>().getLocation();
  String randNum = (Random().nextInt(900000) + 100000).toString();


  IssueGetBloc() : super(IssueGetState(issueModal: [], isLoading: false)) {
    on<IssueGetEvent>(getIssue);
    on<IssueDeleteEvent>(deleteIssue);
    on<IssueUpdateEvent>(updateIssue);
    on<IssueAddEvent>(setIssue);
    // on<PushNotification>(pushNotificationsAllUsers);
  }

  Future<void> getIssue(IssueGetEvent event,
      Emitter<IssueGetState> emit) async {
    try {
      List<IssueGetTimeModel> issueModal = [];
      final request =
      await FirebaseFirestore.instance.collection('Issue').get();
      request.docs.forEach((element) {
        return issueModal.add(IssueGetTimeModel.fromJson(element.data()));
      });
      emit(state.copyWith(issueModal: issueModal, isLoading: true));
    } catch (error) {
      print("cause of $error");
      emit(state.copyWith(issueModal: [], isLoading: false));
    }
  }

  Future<void> deleteIssue(IssueDeleteEvent event,
      Emitter<IssueGetState> emit) async {
    FirebaseFirestore.instance
        .collection("Issue")
        .doc(event.id)
        .delete()
        .then((value) => print('This element deleted  ${event.id}'));
  }

  Future<void> updateIssue(IssueUpdateEvent event,
      Emitter<IssueGetState> emit) async {
    await FirebaseFirestore.instance
        .collection("Issue")
        .doc(event.id).update(
        {
          'issue': event.issue,
          'status': event.status,
          'date': Constants.currentDay,
          'id': event.id,
          'location': locationNameLocal,
          'deadline': event.deadline
        }
    );
  }

  Future<void>  setIssue(IssueAddEvent event, Emitter<IssueGetState> emit) async{
    await FirebaseFirestore.instance
        .collection("Issue")
        .doc(randNum)
        .set({
      'issue': event.issue,
      'status': event.status,
      'date' : Constants.currentDay,
      'id' : randNum,
      'location' : locationNameLocal,
      'deadline' : event.deadline
    });
  }

  // Future<void> pushNotificationsAllUsers(PushNotification event, Emitter<IssueGetState> emit) async {
  //
  //   String dataNotifications = '{ '
  //       ' "to" : "/topics/myTopic1" , '
  //       ' "notification" : {'
  //       ' "title":"${event.status}" , '
  //       ' "body":"${event.issue}" '
  //       ' } '
  //       ' } ';
  //
  //   var response = await http.post(
  //     Uri.parse(Constants.BASE_URL),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Authorization': 'key= ${Constants.KEY_SERVER}',
  //     },
  //     body: dataNotifications,
  //   );
  //   print(response.body.toString());
  // }
}
