import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/controllers/testController.dart';
import 'package:quiz_app/models/test.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});
  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  late String testcode;
  late String title;
  final TestController _testControllerer = Get.find();
  late List<Question> questions = [];
  var Selected = "Subjective";
  var questionNo = 1;
  final objFormKey = GlobalKey<FormState>();
  final subFormKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subQuestionController = TextEditingController();
  final TextEditingController _objQuestionController = TextEditingController();
  final TextEditingController _optionA = TextEditingController();
  final TextEditingController _optionB = TextEditingController();
  final TextEditingController _optionC = TextEditingController();
  final TextEditingController _optionD = TextEditingController();

  addObjectiveNext() {
    if (objFormKey.currentState!.validate()) {
      setState(() {
        questionNo++;
        String ques = _objQuestionController.text;
        Question question = Question(
          question: ques,
          options: [_optionA.text, _optionB.text, _optionC.text, _optionD.text],
        );
        _objQuestionController.clear();
        _optionA.clear();
        _optionB.clear();
        _optionC.clear();
        _optionD.clear();
        questions.add(question);
        if (questionNo > 5) {
          title= _titleController.text;
          Test t = Test(
              id: testcode,
              type: "Objective",
              title: title,
              creator: "alina@gmail.com",
              questions: questions);
          _testControllerer.addTest(t);
          Navigator.pushNamed(context, "previewquiz");
          print(t.questions);
        }
      });
    }
  }

  addSubjectiveNext() {
    if (subFormKey.currentState!.validate()) {
      setState(() {
        questionNo++;
        String ques = _subQuestionController.text;
        Question question = Question(
          question: ques,
        );
        _subQuestionController.clear();
        questions.add(question);
        if (questionNo > 5) {
          title= _titleController.text;
          Test t = Test(
              id: testcode,
              type: "Subjective",
              title: title,
              creator: "alina@gmail.com",
              questions: questions);
          _testControllerer.addTest(t);
          Navigator.pushNamed(context, "previewquiz");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    testcode = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
        backgroundColor: const Color(0xffDDDDDE),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Center(
                    child: Text(
                      'Create Your Quiz',
                      style: TextStyle(
                          color: const Color(0xff4E5069),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'select between objective and Subjective quiz ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      width: 50,
                      child: Divider(
                          thickness: 3,
                          color: const Color(0xff4E5069))),
                ),
                Container(
                  width:320 ,
                  child: TextFormField(
                    controller: _titleController,
                    focusNode: _focusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Add Title";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white, // White background
                      filled: true,
                      errorStyle: TextStyle(color: Colors.grey),
                      hintText: "Title",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    cursorColor: Color(0xff4E5069),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
//================================Radio Buttons============================================================
                      Container(
                        width: 157,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: RadioListTile(
                          value: "Subjective",
                          groupValue: "groupValue",
                          title: const Text(
                            'Subjective',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            if (questionNo > 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Alert',
                                      style: TextStyle(
                                          color: Color(0xff4E5069)),
                                    ),
                                    content:
                                    const Text("Are you Sure to quit? "),
                                    actions: [
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                          overlayColor:
                                          MaterialStateProperty.all(
                                              Colors.blue.withOpacity(0.2)),
                                        ),
                                        onPressed: () {
                                          questionNo = 1;
                                          setState(() {});
                                          Navigator.pop(
                                              context); // Dismiss the dialog
                                          Navigator.pushNamed(
                                              context, "CreateQuiz");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text('Yes',
                                              style: TextStyle(
                                                color: const Color(0xff4E5069),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                          overlayColor:
                                          MaterialStateProperty.all(
                                              Colors.blue.withOpacity(0.2)),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Dismiss the dialog
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text('No',
                                              style: TextStyle(
                                                color: const Color(0xff4E5069),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            setState(() {
                              Selected = "Subjective";
                            });
                          },
                          fillColor: MaterialStateColor.resolveWith((states) =>
                          Selected == "Subjective"
                              ? const Color(0xff4E5069)
                              : Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 160,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: RadioListTile(
                          value: "Objective",
                          groupValue: "groupValue",
                          title: const Text(
                            'Objective',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            if (questionNo > 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Alert',
                                      style: TextStyle(
                                          color: Color(0xff4E5069)),
                                    ),
                                    content:
                                    const Text("Are you Sure to quit? "),
                                    actions: [
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                          overlayColor:
                                          MaterialStateProperty.all(
                                              Colors.blue.withOpacity(0.2)),
                                        ),
                                        onPressed: () {
                                          questionNo = 1;
                                          setState(() {});
                                          Navigator.pop(
                                              context); // Dismiss the dialog
                                          Navigator.pushNamed(
                                              context, "CreateQuiz");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text('Yes',
                                              style: TextStyle(
                                                color: const Color(0xff4E5069),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                          overlayColor:
                                          MaterialStateProperty.all(
                                              Colors.blue.withOpacity(0.2)),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Dismiss the dialog
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text('No',
                                              style: TextStyle(
                                                color: const Color(0xff4E5069),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            setState(() {
                              Selected = "Objective";
                            });
                          },
                          fillColor: MaterialStateColor.resolveWith((states) =>
                          Selected == "Subjective"
                              ? const Color(0xff4E5069)
                              : Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
//==================================Forms================================================================
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 2,
                            color: Colors.grey.withOpacity(0.5)),
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Selected == "Subjective"
                            ? Form(
                          key: subFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Question: $questionNo/5"),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _subQuestionController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Add Question";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  errorStyle:
                                  TextStyle(color: Colors.grey),
                                  hintText: "Type your Question here!",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: const Color(0xff4E5069),
                                maxLines: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Color(0xff4E5069)),
                                        overlayColor:
                                        MaterialStateProperty.all(
                                            Colors.blue
                                                .withOpacity(0.2)),
                                      ),
                                      onPressed: () {
                                        _titleController.text.isEmpty?FocusScope.of(context).requestFocus(_focusNode):addSubjectiveNext();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(18.0),
                                        child: Text(
                                            questionNo < 5
                                                ? 'Add'
                                                : 'Done',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                            : Form(
                          key: objFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Question: $questionNo /5"),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _objQuestionController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must Add Question";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Type your Question here!",
                                  errorStyle:
                                  TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: const Color(0xff4E5069),
                                maxLines: 5,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextFormField(
                                controller: _optionA,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Option must not be Empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Option A",
                                  errorStyle:
                                  const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: const Color(0xff4E5069),
                                // maxLines: 5,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextFormField(
                                controller: _optionB,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Option must not be Empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Option B",
                                  errorStyle:
                                  const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: const Color(0xff4E5069),
                                // maxLines: 5,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextFormField(
                                controller: _optionC,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Option must not be Empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Option C",
                                  errorStyle:
                                  const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: const Color(0xff4E5069),
                                // maxLines: 5,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextFormField(
                                controller: _optionD,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Option must not be Empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Option D",
                                  errorStyle:
                                  const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                        Colors.grey.withOpacity(0.5)),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey),
                                  ),
                                ),
                                cursorColor: const Color(0xff4E5069),
                                // maxLines: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Color(0xff4E5069)),
                                        overlayColor:
                                        MaterialStateProperty.all(
                                            Colors.blue
                                                .withOpacity(0.2)),
                                      ),
                                      onPressed: () {
                                        _titleController.text.isEmpty?FocusScope.of(context).requestFocus(_focusNode):addObjectiveNext();
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(18.0),
                                        child: Text(
                                            questionNo < 5
                                                ? 'Add'
                                                : 'Done',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
