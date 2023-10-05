import 'package:quiz_app/models/test.dart';
import 'package:quiz_app/models/user.dart';

class Attempts
{
  late String id;
  late Test test;
  late User giver;
  late List<String> answers;
  late int? marks;

  Attempts({
    required this.id,
    required this.test,
    required this.giver,
    required this.answers,
  });
}