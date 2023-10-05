import 'package:get/get.dart';
import 'package:quiz_app/models/attemps.dart';

class AttemptsController extends GetxController{
  List<Attempts> attempts = <Attempts>[].obs;


  addTest(Attempts a)
  {
    attempts.add(a);
    update();
  }

  int myAttemptCount(String user)
  {
    int count=0;
    for(int i=0; i<attempts.length; i++)
    {
      if(user==attempts[i].giver)
      {
        count++;
      }
    }
    return count;
  }
  Attempts getAttempt(String id)
  {
    Attempts t= attempts[0];
    for(int i=0; i<attempts.length; i++)
    {
      if(id==attempts[i].id)
      {
        t = attempts[i];
      }
    }
    return t;
  }
  delAttempts(String id)
  {
    for(int i=0; i<attempts.length; i++)
    {
      if(id==attempts[i].id)
      {
        attempts.removeAt(i);
      }
    }
    update();
  }

  Object myAttemptedTest(String user)
  {
    List<Attempts> myTests = [];
    for(int i=0; i<attempts.length; i++)
    {
      if(user==attempts[i].giver)
      {
        myTests.add(attempts[i]);
      }
    }
    return myTests;
  }



}