import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/testController.dart';
import '../models/test.dart';

class TakeQuiz extends StatefulWidget {
  const TakeQuiz({super.key});

  @override
  State<TakeQuiz> createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  late String testcode;
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
  List radioSelections = [
    -1 , -1, -1, -1, -1
  ];


  @override
  Widget build(BuildContext context) {
    testcode = ModalRoute.of(context)!.settings.arguments.toString();
    TestController testController = Get.find();
    Test t = testController.getTest(testcode);
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
                    t.title,
                    style: TextStyle(
                        color: const Color(0xff4E5069),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Text(
                  t.type,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
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
                        return t.type == "Subjective"
                            ? ListTile(
                                title: Text(t.questions[index].question),
                                subtitle: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 8.0),
                                    child: TextFormField(
                                      controller: controllers[index],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Answer the Question";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Write you answer here",
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
                                      maxLines: 3,
                                    )),
                                leading: Text((index + 1).toString()),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, top: 18),
                                    child: Text(
                                      t.questions[index].question,
                                      style: TextStyle(
                                          color: const Color(0xff4E5069),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  RadioListTile(
                                      fillColor:MaterialStateColor.resolveWith((states) => radioSelections[index]==0? Colors.orange: Colors.grey),
                                      title: Text(
                                        t.questions[index].options![0],
                                        style: TextStyle(
                                          color: const Color(0xff4E5069),
                                          fontSize: 15,
                                        ),
                                      ),
                                      value: t.questions[index].options![0],
                                      groupValue: index,
                                      onChanged: (value) {
                                        setState(() {
                                          radioSelections[index]=0;
                                        });
                                      }),
                                  RadioListTile(
                                      fillColor:MaterialStateColor.resolveWith((states) => radioSelections[index]==1? Colors.orange: Colors.grey),
                                      title: Text(
                                      t.questions[index].options![1],
                                        style: TextStyle(
                                          color: const Color(0xff4E5069),
                                          fontSize: 15,
                                        ),
                                      ),
                                      value: t.questions[index].options![1],
                                      groupValue: index,
                                      onChanged: (value) {
                                        setState(() {
                                          radioSelections[index]=1;
                                        });
                                      }),
                                  RadioListTile(
                                      fillColor:MaterialStateColor.resolveWith((states) => radioSelections[index]==2? Colors.orange: Colors.grey),
                                      title: Text(
                                        t.questions[index].options![2],
                                        style: TextStyle(
                                          color: const Color(0xff4E5069),
                                          fontSize: 15,
                                        ),
                                      ),
                                      value: t.questions[index].options![2],
                                      groupValue: index,
                                      onChanged: (value) {
                                        setState(() {
                                          radioSelections[index]=2;
                                        });
                                      }),
                                  RadioListTile(
                                      fillColor:MaterialStateColor.resolveWith((states) => radioSelections[index]==3? Colors.orange: Colors.grey),
                                      title: Text(
                                        t.questions[index].options![3],
                                        style: TextStyle(
                                          color: const Color(0xff4E5069),
                                          fontSize: 15,
                                        ),
                                      ),
                                      value:t.questions[index].options![3],
                                      groupValue: index,
                                      onChanged: (value) {
                                        setState(() {
                                          radioSelections[index]=3;
                                        });
                                      }),
                                ],
                              );
                      }),
                ),
              ),
              TextButton(
                  onPressed: () {
                    if(t.type=="Subjective")
                      {
                        List answer = [];
                      for(int i=0; i<controllers.length; i++)
                      {
                        answer.add(controllers[i].text);
                      }
                      print(answer);

                      }
                    else
                      {
                        print(radioSelections);

                      }
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
                      "Submit",
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
