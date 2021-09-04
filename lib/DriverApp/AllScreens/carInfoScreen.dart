import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:megaride/DriverApp/AllScreens/DriverMainScreen.dart';
import 'package:megaride/DriverApp/DriverRegistration/registrationScreen.dart';
import 'package:megaride/MapsCofig/configMaps.dart';
import 'package:megaride/main.dart';
class CarInfoScreen extends StatelessWidget {
  static const String idScreen = "carInfo";
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carSeatsTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Enter your car details",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 25,),
              Text("Car Model",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),),
              Padding(padding: EdgeInsets.only(right:20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: TextField(
                        controller: carModelTextEditingController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Enter your car model",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Text("Number Plate",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),),
              Padding(padding: EdgeInsets.only(right:20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: TextField(
                        controller: carNumberTextEditingController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Enter your car number",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Text("Available Seats",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),),
              Padding(padding: EdgeInsets.only(right:20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: TextField(
                        controller: carSeatsTextEditingController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Enter your car seats",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              SizedBox(
                height:50, //height of button
                width:320, //width of button
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    primary: Color.fromARGB(255, 255, 200, 87), //background color of button
                    elevation: 2, //elevation of button
                  ),
                  onPressed: () {
                    if(carModelTextEditingController.text.isEmpty){
                      displayToastMessage("Please write car model", context);
                    }

                    else if(carNumberTextEditingController.text.isEmpty){
                      displayToastMessage("Please write car number", context);
                    }

                    else if(carSeatsTextEditingController.text.isEmpty){
                      displayToastMessage("Please write car seats", context);
                    }

                    else{
                      saveDriverCarInfo(context);
                    }

                  },
                  child: Text("Save Data",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void saveDriverCarInfo(context){
    String userId = currentfirebaseUser.uid;

    Map carInfoMap = {
      "car_model":carModelTextEditingController.text,
      "car_number":carNumberTextEditingController.text,
      "car_seats":carSeatsTextEditingController.text,
    };
    driversRef.child(userId).child("car_details").set(carInfoMap);
    
    Navigator.pushNamedAndRemoveUntil(context, DriverMainScreen.idScreen, (route) => false);
  }
}
