import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/testController.dart';
import 'package:quiz_app/main.dart';

class PreviewQuiz extends StatefulWidget {
  const PreviewQuiz({super.key});

  @override
  State<PreviewQuiz> createState() => _PreviewQuizState();
}

class _PreviewQuizState extends State<PreviewQuiz> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 5), () { });
  }

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.find();
    return GetBuilder<TestController>(builder: (controller)
    {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Center(
                    child: Text(
                      controller.tests.last.title,
                      style: TextStyle(
                          color: const Color(0xff4E5069),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    controller.tests.last.type,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: controller.tests.last.type == "Objective"?480:350,
                    child: ListView.builder(
                        itemCount: controller.tests.last.questions.length,
                        itemBuilder: (context, index) {
                          return controller.tests.last.type == "Subjective"
                              ? ListTile(
                            title: Text(controller.tests.last.questions[index].question),
                            leading: Text((index + 1).toString()),
                          )
                              : ListTile(
                            title: Text(controller.tests.last.questions[index].question),
                            leading: Text((index + 1).toString()),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("(a) ${controller.tests.last.questions[index].options![0]}"),
                                Text("(b) ${controller.tests.last.questions[index].options![1]}"),
                                Text("(c) ${controller.tests.last.questions[index].options![2]}"),
                                Text("(d) ${controller.tests.last.questions[index].options![3]}"),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      const snackBar =  SnackBar(
                        content:  Text('Your Quiz is Published!'),
                        duration: Duration(seconds: 3), // Duration for how long it will be displayed
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamed(context, 'home');
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
                        "Publish",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      );
    });

  }
}
