import 'package:quiz_app/models/question.dart';
class Test
{
  late String id;
  late String title;
  late String type;
  late String creator;
  late List<Question> questions;

  Test({
    required this.title,
    required this.id,
    required this.type,
    required this.creator,
    required this.questions,
  });
}