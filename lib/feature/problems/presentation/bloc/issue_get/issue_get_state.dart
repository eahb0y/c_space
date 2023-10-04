part of '../../../../problems/presentation/bloc/issue_get/issue_get_bloc.dart';

class IssueGetState extends Equatable {
  final List<IssueGetTimeModel>? issueModal;
  final bool isLoading;

  IssueGetState({
    required this.issueModal,
    required this.isLoading,
  });

  IssueGetState copyWith({
    List<IssueGetTimeModel>? issueModal,
    bool? isLoading,
  }) {
    return IssueGetState(
      issueModal: issueModal ?? this.issueModal,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [issueModal, isLoading];
}
