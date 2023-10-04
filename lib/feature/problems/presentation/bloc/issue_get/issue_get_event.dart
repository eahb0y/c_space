part of 'issue_get_bloc.dart';

abstract class IssueEvent extends Equatable {
  IssueEvent();
}

class IssueGetEvent extends IssueEvent {
  @override
  List<Object?> get props => [];
}

class IssueDeleteEvent extends IssueEvent {
  final String id;

  IssueDeleteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class IssueUpdateEvent extends IssueEvent {
  final String id;
  final String issue;
  final String status;
  final String deadline;

  IssueUpdateEvent({
    required this.id,
    required this.issue,
    required this.deadline,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        issue,
        deadline,
        status,
      ];
}

class IssueAddEvent extends IssueEvent {
  final String issue;
  final String status;
  final String deadline;

  IssueAddEvent({
    required this.status,
    required this.issue,
    required this.deadline,
  });

  @override
  List<Object?> get props => [
        status,
        issue,
        deadline,
      ];
}

class PushNotification extends IssueEvent {
  final String issue;
  final String status;

  PushNotification({
    required this.issue,
    required this.status,
  });

  @override
  List<Object?> get props => [issue, status];
}
