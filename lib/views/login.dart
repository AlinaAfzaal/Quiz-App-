import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/reusablewidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String errorMsg ="";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void LoginFun(String email, String pass) async{
    final _credential = await SharedPreferences.getInstance();
    if(email==_credential.getString('email') && pass==_credential.getString('pass'))
    {
      Navigator.pushNamed(context, "home");
    }
    else
    {
      errorMsg = "Wrong Email or Password";
      setState(() {

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4E5069), Color(0xff5B518A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, color: Color(0xffDDDDDE)),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    errorMsg,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),
                  mYTextField(_emailController, "Add Email", "example@gmail.com"),
                  const SizedBox(height: 20),
                  mYTextField(_passController, "Add Password", "abc"),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 155,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginFun(_emailController.text, _passController.text);
                        }
                      },
                      child: Padding(
                        padding:   EdgeInsets.all(15.0),
                        child:  Text("Login",
                            style:  TextStyle(
                                color: Color(0xff4E5069),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffDDDDDE),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'signin');
                      },
                      child: Center(
                          child: myLinkText("Dont'have Account?"),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
