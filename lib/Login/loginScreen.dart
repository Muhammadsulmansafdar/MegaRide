import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:megaride/Config/config.dart';
import 'package:megaride/Home/mainScreen.dart';
import 'file:///D:/MegaXtudio/megaride/lib/RegistrationScreens/registerationScreen.dart';
import 'package:megaride/main.dart';

class loginScreen extends StatefulWidget {
  static const String idScreen = "login";

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: Color(0xFFE5e5e5),*/
      /*backgroundColor: Colors.white,*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:20.0,),
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
              Text("Welcome,",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                ),),
              /*SizedBox(height: 1.0,),*/
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: SizedBox(
                  height: 0.5,),
              ),
              Text("Login to your account",
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
                        keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 11.0),
                child: TextButton(
                  child: Text(
                    "Forget password?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 255, 200, 87),
                    ),
                  ),
                  onPressed:(){
                    },
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(right:20.0),
                child: Container(
                  height:50, //height of button
                  width:350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      primary: Color.fromARGB(255, 255, 200, 87), //background color of button
                      elevation: 2, //elevation of button
                    ),
                    onPressed: () {
                      if(!emailTextEditingController.text.contains("@")){
                        displayToastMessage("Email address is not valid", context);
                      }
                      else if(passwordTextEditingController.text.isEmpty){
                        displayToastMessage("Password is mandatory", context);
                      }
                      else {
                        loginAndAuthenticateUser();
                      }
                    },
                    child: Text("Log In",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(right:20.0),
                child: Container(
                  height:50, //height of button
                  width:350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      primary: Color.fromARGB(255, 	45, 55, 72), //background color of button
                      elevation: 2, //elevation of button
                    ),
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterationScreen()),
                      );*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.google),
                        SizedBox(width: 10),
                        Text('Sign-in using Google',
                            style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                  padding: EdgeInsets.only(top: 180),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 	97, 97, 97), fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(text: ' Sign up',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 200, 87), fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(context, RegisterationScreen.idScreen, (route) => false);
                                  }
                            )
                          ]
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser() async{
    showDialog(
        context: context,
        builder:(c){
          return displayToastMessage("Authenticating, Please wait...", context);
        }
    );

    User firebaseUser;
    await _firebaseAuth.signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    ).then((authUser){
      firebaseUser = authUser.user;
    }).catchError((errMsg){
      displayToastMessage("Error: " + errMsg.toString(), context);
    });
    if(firebaseUser != null){
      readData(firebaseUser).then((s){
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder:(c) =>mainScreen());
        Navigator.pushReplacement(context, route);
      });
    }
  }
  Future readData(User fUser)async{
    FirebaseFirestore.instance.collection("user").doc(fUser.uid).get().then((dataSnapshot)
    async {
      await MegaRideApp.sharedPreferences.setString("uid", dataSnapshot.data()[MegaRideApp.userUID]);

      await MegaRideApp.sharedPreferences.setString(MegaRideApp.userEmail, dataSnapshot.data()[MegaRideApp.userEmail]);

      await MegaRideApp.sharedPreferences.setString(MegaRideApp.userName, dataSnapshot.data()[MegaRideApp.userName]);

      await MegaRideApp.sharedPreferences.setString(MegaRideApp.riderRole, dataSnapshot.data()[MegaRideApp.riderRole]);

      /*await MegaRideApp.sharedPreferences.setString(MegaRideApp.userAvatarUrl, dataSnapshot.data()[MegaRideApp.userAvatarUrl]);*/
      /*List<String> cartList = dataSnapshot.data()[MegaRideApp.userCartList].cast<String>();
      await MegaRideApp.sharedPreferences.setStringList(MegaRideApp.userCartList, cartList);*/
    });
  }










  /*void loginAndAuthenticateUser(BuildContext context) async
  {
    final User firebaseUser = (await _firebaseAuth
        .signInWithEmailAndPassword(email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((errMsg){
      displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;
    if(firebaseUser !=null) //user created
        {
        //save user info to database
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value != null){
          Navigator.pushNamedAndRemoveUntil(context, mainScreen.idScreen, (route) => false);
          displayToastMessage("Logged-in", context);
        }
        else {
          _firebaseAuth.signOut();
          displayToastMessage("No record found, Please create an account", context);
        }
      });
    }
    else{
      displayToastMessage("Error occurred, can not be Signed-In", context);
    }

  }*/


}
