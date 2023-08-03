import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/issue/data/model/issue_get_time_model.dart';
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
    on<IssueUpdateEvent>(setIssue);
  }

  Future<void> getIssue(IssueGetEvent event,
      Emitter<IssueGetState> emit) async {
    // await Future.delayed( Duration(seconds: 2));
    try {
      List<IssueGetTimeModel> issueModal = [];
      final request =
      await FirebaseFirestore.instance.collection('Issue').get();
      request.docs.forEach((element) {
        return issueModal.add(IssueGetTimeModel.fromJson(element.data()));
      });
      print(request);
      print(issueModal);
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

  Future<void> setIssue(IssueUpdateEvent event,
      Emitter<IssueGetState> emit) async {
    await FirebaseFirestore.instance
        .collection("Issue")
        .doc(event.id).update(
        {
          'issue': event.issue,
          'status': event.status,
          'date': currentDay,
          'id': event.id,
          'location': locationNameLocal,
          'deadline': event.deadline
        }
    );
  }
}
