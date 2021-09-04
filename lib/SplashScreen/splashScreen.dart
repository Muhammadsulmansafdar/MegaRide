import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaride/Config/config.dart';
import 'package:megaride/DriverApp/AllScreens/DriverMainScreen.dart';
import 'package:megaride/Home/mainScreen.dart';
import 'package:megaride/UserType/userType.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;
class SplashScreen extends StatefulWidget {
  static const String idScreen = "splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState(){
    super.initState();
    displaySplash();
  }
  displaySplash(){
    Timer(Duration(seconds: 3), () async {
     /* StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (index, snapshot) {
          if(MegaRideApp.auth.currentUser == MegaRideApp.userUID){
            Route route = MaterialPageRoute(builder:(_) => mainScreen());
            Navigator.pushReplacement(context, route);
          }
          else if(MegaRideApp.auth.currentUser == MegaRideApp.driver ){
            Route route = MaterialPageRoute(builder:(_) => DriverMainScreen());
            Navigator.pushReplacement(context, route);
          }
          else if(MegaRideApp.auth.currentUser == null ){
            Route route = MaterialPageRoute(builder:(_) => userType());
            Navigator.pushReplacement(context, route);
          }
          else{
            Route route = MaterialPageRoute(builder:(_) => userType());
            Navigator.pushReplacement(context, route);
          }
        },
      ),*/
    });
  }

  Future getValidationData()async{
    MegaRideApp.sharedPreferences = await SharedPreferences.getInstance();
    var obtainEmail = MegaRideApp.sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtainEmail;
    });
    print(finalEmail);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height:50, //height of button
          width:330, //width of button
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              primary: Color.fromARGB(255, 255, 200, 87), //background color of button
              elevation: 2, //elevation of button
            ),
            onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, userType.idScreen, (route) => false);
          },
            child: Text("Start",
              style: TextStyle(
                fontSize: 18.0,
              ),),
          ),
        ),
      ),
    );
    /*Material(
      child: Container(
        color: Colors.white,
        *//*decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          ),
        ),*//*
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              *//*Image.asset("images/welcome.png"),*//*
              SizedBox(height: 20.0,),
              Text(
                "Welcome to Mega Ride",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
*/
  }
}



