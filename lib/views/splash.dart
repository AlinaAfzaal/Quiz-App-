import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.asset(
            'assets/splashbackground.png', // Replace with your background image file path
            fit: BoxFit.fill,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2 + 100,
            left: MediaQuery.of(context).size.width/2 - 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.9)),
                overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
              ),
              onPressed: () async {
                final _credential = await SharedPreferences.getInstance();
                if(_credential.getString("email")!=null)
                  {
                    Navigator.pushNamed(context, 'home');
                  }
                else
                  {
                    Navigator.pushNamed(context, 'signin');
                  }
              },
              child: const  Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Get Started',style:TextStyle(color:Color(0xff4E5069),fontWeight: FontWeight.bold,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}