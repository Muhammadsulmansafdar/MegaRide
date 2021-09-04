import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megaride/Config/config.dart';
import 'package:megaride/Login/loginScreen.dart';
import 'package:megaride/SplashScreen/splashScreen.dart';
import 'package:megaride/UserType/userType.dart';
import 'package:megaride/notificationPage.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
class profiledata extends StatefulWidget {
  static const String idScreen = "profileData";
  @override
  _profiledataState createState() => _profiledataState();
}

class _profiledataState extends State<profiledata> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://picsum.photos/id/1/200/200'),
              ),
            ),
            Center(
              child: Container(
                height: 60.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    child: Text(
                      "Mega Ride",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0, right:12.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(child: Text("Edit Profile", style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),)),
                      Icon(Icons.arrow_forward_ios,color: Colors.black54, size: 20.0,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0, right:12.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(child: Text("Service Terms", style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),),),
                      Icon(Icons.arrow_forward_ios,color: Colors.black54, size: 20.0,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0, right:12.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(child: Text("Privacy Policy", style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),)),
                      Icon(Icons.arrow_forward_ios,color: Colors.black54, size: 20.0,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0, right:12.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(child: Text("Notification", style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),),),
                        SizedBox(
                          height: 35.0,
                          width: 65.0,
                          child: CustomSwitch(
                            value:isSwitched,
                            activeColor:  Color.fromARGB(255, 255, 200, 87),
                            onChanged: (value){
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    onTap:() {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notification()),
                    );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0, right:12.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: GestureDetector(
                    child: Row(
                      children: [
                        Expanded(child: Text("Log Out", style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ),)),
                      ],
                    ),
                    onTap: () async {
                      MegaRideApp.sharedPreferences = await SharedPreferences.getInstance();
                      MegaRideApp.sharedPreferences.remove('email');
                      Navigator.pushNamedAndRemoveUntil(context, userType.idScreen, (route) => false);
                      /*FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, SplashScreen.idScreen, (route) => false);*/
                },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
