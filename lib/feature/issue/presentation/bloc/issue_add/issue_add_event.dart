part of 'issue_add_bloc.dart';

class IssueAddEvent extends Equatable {
  final String issue;
  final String status;
  final String deadline;

  IssueAddEvent({
    required this.status,
    required this.issue,
    required this.deadline,
  });

  @override
  List<Object?> get props => [];
}
