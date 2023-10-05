import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/reusablewidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() {
    return _SigninPageState();
  }
}

class _SigninPageState extends State<SignUp>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void SignInFun(String email, String pass) async{
    final _credential = await SharedPreferences.getInstance();
    _credential.setString('email', email);
    _credential.setString('pass', pass);
    Navigator.pushNamed(context, "home");
  }
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
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
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, color: Color(0xffDDDDDE)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  mYTextField(_emailController, "Add Email", "example@gmail.com"),
                  SizedBox(height: 20),
                  mYTextField(_passController, "Add Password", "abc"),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 155,
                    child: myElevatedButton("Sign Up",(){
                      if (_formKey.currentState!.validate()) {
                        SignInFun(_emailController.text, _passController.text);
                      print(
                      "Email: $_emailController.text, Password: $_passController.text");
                      }
                    }),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Center(
                        child: myLinkText("I've account Login"),
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

