class CourseModel {
  final String id;
  final String title;
  final String description;
  final String trainerId;
  final DateTime startDate;
  final DateTime endDate;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.trainerId,
    required this.startDate,
    required this.endDate,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      trainerId: json['trainerId'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'trainerId': trainerId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
