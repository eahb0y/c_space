class IssueGetTimeModel {
  final String issue;
  final String status;
  final String id;
  final String location;
  final String date;
  final String deadline;

  IssueGetTimeModel({
    required this.status,
    required this.issue,
    required this.id,
    required this.date,
    required this.location,
    required this.deadline
  });
  factory IssueGetTimeModel.fromJson(Map<String, dynamic> json) {
    return IssueGetTimeModel(
      date: json['date'],
      issue: json['issue'],
      status: json['status'],
      location: json['location'],
      id: json['id'],
      deadline: json['deadline']
    );
  }
}
