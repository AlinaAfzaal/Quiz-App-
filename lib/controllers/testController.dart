import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/test.dart';

class TestController extends GetxController{
  List<Test> tests = <Test>[].obs;
  // List<Quiz> cartItem = List<Quiz>.empty().obs;//make the cartItem observable

  addTest(Test t)
  {
    tests.add(t);
    update();
  }

  Test getTest(String id)
  {
    Test t= tests[0];
    for(int i=0; i<tests.length; i++)
      {
        if(id==tests[i].id)
          {
            t = tests[i];
          }
      }
    return t;
  }
  delTest(String id)
  {
    for(int i=0; i<tests.length; i++)
    {
      if(id==tests[i].id)
      {
        tests.removeAt(i);
      }
    }
  }

  Object myCreatedTest(String user)
  {
    List<Test> myTests = [];
    for(int i=0; i<tests.length; i++)
    {
      if(user==tests[i].creator)
      {
        myTests.add(tests[i]);
      }
    }
    return myTests;
  }



}