import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:megaride/Config/config.dart';
import 'package:megaride/Home/mainScreen.dart';
import 'package:megaride/main.dart';
import 'file:///D:/MegaXtudio/megaride/lib/Login/loginScreen.dart';

class RegisterationScreen extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top:15.0),
        child: Container(
          width: 47,
          child: RawMaterialButton(
            shape: CircleBorder(),
            fillColor: Colors.white,
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, loginScreen.idScreen, (route) => false);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 200, 87),
              size: 25.0,
            ),
            constraints: BoxConstraints.tightFor(
              width: 56.0,
              height: 56.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60.0,),
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: SizedBox(
                  height: 1.0,),
              ),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: SizedBox(
                  height: 0.5,),
              ),
              Text("Create a new account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(top:5.0),
                child: SizedBox(
                  height: 1,),
              ),
              SizedBox(height: 15.0),
              Text("Full Name",
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
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Your full name",
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
              SizedBox(height: 14.0),
              Text("Email",
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
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Enter your email here",
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
              SizedBox(height: 15.0),
              Text("Phone number",
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
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Enter your phone number",
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
              SizedBox(height: 10.0),
              Text("Password",
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
                        controller: passwordTextEditingController,
                        obscureText: visibility,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          labelText: "Enter your password here",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: Icon(
                              visibility ?
                              Icons.visibility_off : Icons.visibility, color: Colors.grey,),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.only(right:20.0),
                child: Container(
                  height:50, //height of button
                  width:353,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      primary: Color.fromARGB(255, 255, 200, 87), //background color of button
                      elevation: 2, //elevation of button
                    ),
                    onPressed: () {
                      if(nameTextEditingController.text.length < 4){
                        displayToastMessage("Name must be atleast 3 characters", context);
                      }
                      else if(!emailTextEditingController.text.contains("@")){
                        displayToastMessage("Email address is not valid", context);
                      }
                      else if(phoneTextEditingController.text.isEmpty){
                        displayToastMessage("Phone number field is empty", context);
                      }
                      else if(passwordTextEditingController.text.length < 7){
                        displayToastMessage("Password must be atleast 6 characters", context);
                      }
                      else{
                        registerNewUser();
                      }
                    },
                    child: Text("Sign Up",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.only(top: 62),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 	97, 97, 97), fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign In',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 200, 87), fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {Navigator.pop(
                                  context,
                                  MaterialPageRoute(builder: (context) => loginScreen()),
                                );
                                },
                          )
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser() async
  {
    User firebaseUser;

    await _firebaseAuth.createUserWithEmailAndPassword
      (
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),

    ).then((auth)
    {
      firebaseUser = auth.user;
    }).catchError((errMsg)
    {
      displayToastMessage("Error: " + errMsg.toString(), context);
    });
    if(firebaseUser != null)
    {
      saveUserInfoToFireStore(firebaseUser).then((value){
        Navigator.pushNamedAndRemoveUntil(context, mainScreen.idScreen, (route) => false);
      });
    }
  }
  Future saveUserInfoToFireStore(User fUser) async
  {
    FirebaseFirestore.instance.collection("user").doc(fUser.uid).set({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": nameTextEditingController.text.trim(),
      "role" : MegaRideApp.riderRole,
    });
    await MegaRideApp.sharedPreferences.setString("uid", fUser.uid);
    await MegaRideApp.sharedPreferences.setString(MegaRideApp.userEmail, fUser.email);
    await MegaRideApp.sharedPreferences.setString(MegaRideApp.userName, nameTextEditingController.text);
    await MegaRideApp.sharedPreferences.setString(MegaRideApp.riderRole, "rider");
  }

  /*void registerNewUser(BuildContext context) async
  {
    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((errMsg){
      displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;
    if(firebaseUser !=null) //user created
        {
      //save user info to database
      userRef.child(firebaseUser.uid);
      Map userDataMap={
        "name": nameTextEditingController.text.trim(),
        "Email": emailTextEditingController.text.trim(),
        "Phone": phoneTextEditingController.text.trim(),
        "Password": passwordTextEditingController.text,
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("New user account has been created", context);
      Navigator.pushNamedAndRemoveUntil(context, mainScreen.idScreen, (route) => false);
    }
    else{
      displayToastMessage("New user account has not been Created.", context);
    }
  }*/
}


displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}
