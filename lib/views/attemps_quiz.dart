import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/attemptsController.dart';
import '../controllers/testController.dart';
import '../models/attemps.dart';
import '../models/test.dart';
import '../widgets/reusablewidgets.dart';

class AttemptQuiz extends StatefulWidget {
  const AttemptQuiz({super.key});

  @override
  State<AttemptQuiz> createState() => _AttemptQuizState();
}

class _AttemptQuizState extends State<AttemptQuiz> {
  late String attemptcode;
  @override
  void initState() {
    super.initState();
  }

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    attemptcode = ModalRoute.of(context)!.settings.arguments.toString();
    AttemptsController attemptController = Get.find();
    Attempts a = attemptController.getAttempt(attemptcode);
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<TestController>(builder: (controller){
              return
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Center(
                          child: Text(
                            "Test Taker:  " + a.giver.toString(),
                            style: TextStyle(
                                color: const Color(0xff4E5069),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 480,
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return
                                    ListTile(
                                  title: Text(a.test.questions[index].question),
                                  subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 8.0),
                                      child: Text(a.answers[index])
                                  ),
                                  leading: Text((index + 1).toString()),
                                  trailing: Row(
                                    children: [
                                      myIconButton(Icons.check,Colors.green,(){}),
                                      myIconButton(Icons.clear,Colors.red,(){}),

                                    ],

                                  ),
                                );
                              }),
                        ),
                      ),
                      TextButton(
                          onPressed: () {

                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color(0xff4E5069)),
                            overlayColor: MaterialStateProperty.all(
                                Color(0xff4E5069)),
                          ),
                          child: const Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 18.0, horizontal: 65),
                            child: Text(
                              "Marked",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(height: 15,)
                    ],
                  ),
                );

            })));
  }
}
