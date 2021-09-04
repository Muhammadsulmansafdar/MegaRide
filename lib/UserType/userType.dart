import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:megaride/DriverApp/DriverLogin/DriverLogin.dart';
import 'package:megaride/DriverApp/DriverRegistration/registrationScreen.dart';
import 'package:megaride/Login/loginScreen.dart';

class userType extends StatefulWidget {
  static const String idScreen = "userType";
  @override
  _userTypeState createState() => _userTypeState();
}

class _userTypeState extends State<userType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: Container(
                child: ElevatedButton(
                  child: Text('Request ride',
                    style: TextStyle(fontSize: 20.0),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    primary: Color.fromARGB(255, 255, 200, 87), //background color of button
                    elevation: 2, //elevation of button
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, loginScreen.idScreen, (route) => false);
                  },
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: Container(
                child: ElevatedButton(
                  child: Text('Share my car',
                    style: TextStyle(fontSize: 20.0),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    primary: Color.fromARGB(255, 255, 200, 87), //background color of button
                    elevation: 2, //elevation of button
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, DriverLogin.idScreen, (route) => false);
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}
