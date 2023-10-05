// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/attemptsController.dart';
import 'package:quiz_app/views/create_quiz.dart';
import 'package:quiz_app/views/login.dart';
import 'package:quiz_app/views/preview_quiz.dart';
import 'package:quiz_app/views/quiz.dart';
import 'package:quiz_app/views/signup.dart';
import 'package:quiz_app/views/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/testController.dart';

void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color primary = Color(0xffDDDDDE);
  Color secondary1 = Color(0xffC8C3C2);
  Color secondary2 = Color(0xff423778);
  Color secondary3 = Color(0xff5B518A);
  Color secondary4 = Color(0xff5B518A);
  Color secondary5 = Color(0xff4E5069);
  Color secondary6 = Color(0xffAC9477);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "home": (context) => const HomePage(),
        "createquiz": (context) => const CreateQuiz(),
        "login": (context) => LoginPage(),
        "signin": (context) => SignUp(),
        "previewquiz": (context) => PreviewQuiz(),
        "takequiz": (context) => TakeQuiz()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String user;
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _quizcontroller = TextEditingController();
  final _quizcontroller2 = TextEditingController();
  TestController testController = Get.put(TestController());
  AttemptsController attemptsController = Get.put(AttemptsController());
  void Credential() async{
    final _credential = await SharedPreferences.getInstance();
    user = _credential.getString('email').toString();

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Credential();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                    height: 200,
                    color: Color(0xff4E5069),
                    child: const Padding(
                      padding: const EdgeInsets.all(18),
                      child: Padding(
                        padding: EdgeInsets.only(top: 38),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quiz Time',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Take or Create tests ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    ),
                                  ),
                                ]),
                            Icon(
                              Icons.safety_divider_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, top: 170, right: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            overlayColor: MaterialStateProperty.all(
                                Colors.blue.withOpacity(0.2)),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Enter Quiz Code',
                                    style: TextStyle(
                                        color:
                                        Color(0xff4E5069)),
                                  ),
                                  content: Form(
                                    key: _formkey2,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Code";
                                        }
                                        return null;
                                      },
                                      controller: _quizcontroller2,
                                      decoration: const InputDecoration(
                                        hintText: "Ex: xty56",
                                        border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      cursorColor: const Color(0xff4E5069),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.white),
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.blue.withOpacity(0.2)),
                                      ),
                                      onPressed: () {
                                        if (_formkey2.currentState!.validate()) {
                                          Navigator.pop(context);
                                          String code = _quizcontroller2.text;
                                          _quizcontroller2.clear();
                                          Navigator.pushNamed(
                                            context, "takequiz", arguments: code,
                                          );
                                        }

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('Take',
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
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text('Take',
                                style: TextStyle(
                                  color:
                                      const Color(0xff4E5069),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            overlayColor: MaterialStateProperty.all(
                                Colors.blue.withOpacity(0.2)),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Enter Quiz Code',
                                    style: TextStyle(
                                        color:
                                            Color(0xff4E5069)),
                                  ),
                                  content: Form(
                                    key: _formkey,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Code";
                                        }
                                        return null;
                                      },
                                      controller: _quizcontroller,
                                      decoration: const InputDecoration(
                                        hintText: "Ex: xty56",
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      cursorColor: const Color(0xff4E5069),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.blue.withOpacity(0.2)),
                                      ),
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          Navigator.pop(context);
                                          String code = _quizcontroller.text;
                                          _quizcontroller.clear();
                                          Navigator.pushNamed(
                                            context, "createquiz", arguments: code,
                                          );
                                        }

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('Create',
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
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text('Create',
                                style: TextStyle(
                                  color:
                                      const Color(0xff4E5069),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 18),
            child: Text('My Created Quizs',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color(0xff4E5069),
                )),
          ),

          GetBuilder<TestController>(builder: (controller){
            return Expanded(
            child:
            ListView.builder(
                itemCount: controller.tests.length,
                itemBuilder: (context, index)
                {
                    return
                      Slidable(
                        child: ListTile(
                    title: GestureDetector(
                          child: Text(controller.tests[index].title.toString()),
                        onTap: (){
                            // Navigator.pushNamed(context, routeName);
                            },

                    ),
                    subtitle: Text(controller.tests[index].type),
                    leading:const Icon(Icons.note),
                          trailing: AnimatedContainer(duration: Duration(seconds: 2), child: Icon(Icons.arrow_back)),
                ),
                        endActionPane: const ActionPane(
                          motion:  ScrollMotion(),
                          children: [
                            SlidableAction(
                              flex: 2,
                              onPressed:null,
                              backgroundColor:  Color(0xff4E5069),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),

                      );
            },
            ),
            );
            }
          ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 18),
                child: Text('My Attempted Quizs',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color(0xff4E5069),
                    )),
              ),

              GetBuilder<TestController>(builder: (controller){
                return Expanded(
                  child:
                  ListView.builder(
                    itemCount:attemptsController.myAttemptCount(user),
                    itemBuilder: (context, index)
                    {
                      return
                        Slidable(
                          child: ListTile(
                            title: GestureDetector(
                              child: Text(attemptsController.myAttemptedTest(user).toString()),
                              onTap: (){
                                // Navigator.pushNamed(context, routeName);
                              },

                            ),
                            subtitle: Text(controller.tests[index].type),
                            leading:const Icon(Icons.note),
                            trailing: AnimatedContainer(duration: Duration(seconds: 2), child: Icon(Icons.arrow_back)),
                          ),
                          endActionPane: const ActionPane(
                            motion:  ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 2,
                                onPressed:null,
                                backgroundColor:  Color(0xff4E5069),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),

                        );
                    },
                  ),
                );
              }
              ),
            ]));
  }
}
