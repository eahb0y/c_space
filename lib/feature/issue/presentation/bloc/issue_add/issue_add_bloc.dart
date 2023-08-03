import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:c_space/constants.dart';
import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'issue_add_event.dart';
part 'issue_add_state.dart';

class IssueAddBloc extends Bloc<IssueAddEvent, IssueAddState> {
  String locationNameLocal = sl<LocalSource>().getLocation();
  String randNum = (Random().nextInt(900000) + 100000).toString();

  IssueAddBloc() : super(IssueAddState()) {
    on<IssueAddEvent>(setIssue);
  }

  Future<void>  setIssue(IssueAddEvent event, Emitter<IssueAddState> emit) async{
    await FirebaseFirestore.instance
        .collection("Issue")
        .doc(randNum)
        .set({
      'issue': event.issue,
      'status': event.status,
      'date' : currentDay,
      'id' : randNum,
      'location' : locationNameLocal,
      'deadline' : event.deadline
    });
  }

}
