class Violation {
  final String studentName;
  final String initials;
  final String type;
  final String category;
  final int points;
  final String date;
  final String time;

  const Violation({
    required this.studentName,
    required this.initials,
    required this.type,
    required this.category,
    required this.points,
    required this.date,
    required this.time,
  });
}